import { Controller } from "@hotwired/stimulus";
import mapboxgl from 'mapbox-gl';
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder";

// Connects to data-controller="map"
export default class extends Controller {
  static targets = ["waypoints", "mapContainer"]

  connect() {
    const mapboxAccessToken = this.element.dataset.mapboxApiKey;
    mapboxgl.accessToken = mapboxAccessToken;

    this.map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/chikas/cm00elyc0007101pw2mloe5uw',
      center: [139.759455, 38.6828391], // starting position
      zoom: 4.5
    });

    this.map.addControl(
      new mapboxgl.GeolocateControl({
        positionOptions: {
          enableHighAccuracy: true
        },
        trackUserLocation: true,
        showUserHeading: false
      }),
      'top-left'
    );

    this.map.addControl(
      new MapboxGeocoder({
      accessToken: mapboxgl.accessToken,
      mapboxgl: mapboxgl,
      placeholder: 'Search for a place',
      className: 'custom-geocoder'
    }),
  );

    this.waypoints = [];

    this.map.on('click', (event) => {
      const coords = [event.lngLat.lng, event.lngLat.lat];
      this.waypoints.push(coords);

      ['start', 'end'].forEach(id => {
        if (this.map.getLayer(id)) {
          this.map.removeLayer(id);
          this.map.removeSource(id);
        }
      });

      this.waypoints.forEach((point, index) => {
        this.addMarker(point, `waypoint-${index}`, index === 0 ? '#3887be' : '#f30', true);
      });

      if (this.waypoints.length > 1) {
        this.getRoute(this.waypoints);
      }

      const form = document.querySelector('form');
      const waypointsInput = document.querySelector('#waypoints_input');
     //const waypointsInput = this.waypointsTarget;
      waypointsInput.value = JSON.stringify(this.waypoints);
    });


    this.map.on('contextmenu', (event) => {
      this.addMarker([event.lngLat.lng, event.lngLat.lat], 'landmark', '#000', true);

      const formData = new FormData();
      formData.append('landmark[latitude]', event.lngLat.lat);
      formData.append('landmark[longitude]', event.lngLat.lng);
      formData.append('landmark[name]', 'New Landmark');

      const csrfToken = document.querySelector("[name='csrf-token']").content;

      const options = {
        method: 'POST',
        headers: {
          "Accept": "text/plain",
          "X-CSRF-Token": csrfToken,
        },
        body: formData,
      };

      fetch(`/routes/${this.routeIdTarget}/landmarks`, options)
        .then(response => response.text())
        .then((data) => {
          this.landmarksTarget.insertAdjacentHTML('beforeend', data);
        });
    });
  }

  getRoute(waypoints) {
    const waypointsString = waypoints.map(p => p.join(',')).join(';');
    fetch(
      `https://api.mapbox.com/directions/v5/mapbox/driving-traffic/${waypointsString}?steps=true&geometries=geojson&access_token=${mapboxgl.accessToken}`,
      { method: 'GET' }
    )
    .then(response => response.json())
    .then(json => {
      const data = json.routes[0];
      const route = data.geometry.coordinates;
      const geojson = {
        type: 'Feature',
        properties: {},
        geometry: {
          type: 'LineString',
          coordinates: route
        }
      };

      if (this.map.getSource('route')) {
        this.map.getSource('route').setData(geojson);
      } else {
        this.map.addLayer({
          id: 'route',
          type: 'line',
          source: {
            type: 'geojson',
            data: geojson
          },
          layout: {
            'line-join': 'round',
            'line-cap': 'round'
          },
          paint: {
            'line-color': '#ff5e5e',
            'line-width': 4
          }
        });
      }
    });
  }

  addMarker(coords, id, color, useCustomMarker = false) {
    console.log('Adding marker at', coords);
    const markerElement = useCustomMarker ? this.createCustomMarkerElement() : null;
    new mapboxgl.Marker(markerElement || { color })
      .setLngLat(coords)
      .addTo(this.map);
  }

  createCustomMarkerElement() {
    const el = document.createElement('div');
    el.className = 'custom-marker';
    el.style.backgroundImage = `url(${this.data.get("logoUrl")})`; // URL to your custom icon
    el.style.width = '42px'; // Size of the icon
    el.style.height = '42px';
    el.style.backgroundSize = '100%';
    return el;
  }

  updateMap(coordinates) {
    this.map.flyTo({ center: coordinates, zoom: 12 });
    new mapboxgl.Marker()
      .setLngLat(coordinates)
      .addTo(this.map);
  }
}
