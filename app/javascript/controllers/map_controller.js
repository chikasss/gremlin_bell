import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="map"
export default class extends Controller {
  static targets = ["waypointsInput", "mapContainer"];

  connect() {
    const mapboxAccessToken = this.element.dataset.mapboxApiKey;
    mapboxgl.accessToken = mapboxAccessToken;

    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/chikas/cm00elyc0007101pw2mloe5uw',
      center: [139.759455, 38.6828391], // starting position
      zoom: 4.5
    });

    map.addControl(
      new mapboxgl.GeolocateControl({
        positionOptions: {
          enableHighAccuracy: true
        },
        trackUserLocation: true,
        showUserHeading: false
      })
    );

    let waypoints = [];

    async function getRoute(waypoints) {
      const waypointsString = waypoints.map(p => p.join(',')).join(';');
      const query = await fetch(
        `https://api.mapbox.com/directions/v5/mapbox/driving-traffic/${waypointsString}?steps=true&geometries=geojson&access_token=${mapboxgl.accessToken}`,
        { method: 'GET' }
      );
      const json = await query.json();
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
      // if the route already exists on the map, we'll reset it using setData
      if (map.getSource('route')) {
        map.getSource('route').setData(geojson);
      }
      // otherwise, we'll make a new request
      else {
        map.addLayer({
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
            'line-color': '#6699ff',
            'line-width': 4
          }
        });
      }
      // add turn instructions here at the end
    }

    // Create a custom marker element
    const createCustomMarkerElement = () => {
      const el = document.createElement('div');
      el.className = 'custom-marker';
      el.style.backgroundImage = `url(${this.data.get("logoUrl")})`; // URL to your custom icon
      el.style.width = '32px'; // Size of the icon
      el.style.height = '32px';
      el.style.backgroundSize = '100%';

      return el;
    }

    // Add a marker to the map
    const addMarker = (coords, id, color, useCustomMarker = false) => {
      let markerElement;
      if (useCustomMarker) {
        markerElement = createCustomMarkerElement();
      }

      const marker = new mapboxgl.Marker(markerElement || { color })
        .setLngLat(coords)
        .addTo(map);

      return marker;
    }

    map.on('click', (event) => {
      const coords = [event.lngLat.lng, event.lngLat.lat];
      waypoints.push(coords); // Store each clicked point as a waypoint

      ['start', 'end'].forEach(id => {
        if (map.getLayer(id)) {
          map.removeLayer(id);
          map.removeSource(id);
        }
      });

      // Add markers for all waypoints
      waypoints.forEach((point, index) => {
        addMarker(point, `waypoint-${index}`, index === 0 ? '#3887be' : '#f30', true);
      });

      if (waypoints.length > 1) {
        getRoute(waypoints);
      }

      const form = document.querySelector('form');
      const waypointsInput = document.querySelector('#waypoints_input');
      waypointsInput.value = JSON.stringify(waypoints);
    });

    //Landmarks
    this.map.on('contextmenu', (event) => {
      console.log(event);
      // this.direction.setOrigin([event.lngLat.lng, event.lngLat.lat]);
      addMarker([event.lngLat.lng, event.lngLat.lat], 'landmark', '#000', true);

      const formData = new FormData();
      formData.append('landmark[latitude]', event.lngLat.lat);
      formData.append('landmark[longitude]', event.lngLat.lng);
      formData.append('landmark[name]', 'New Landmark');

      const csrfToken = document.querySelector("[name='csrf-token']").content;

      const options = {
        method: 'POST',
        headers: { "Accept": "text/plain" },
        headers: {
          "X-CSRF-Token": csrfToken, // 👈👈👈 Set the token
        },
        body: formData,
      };

      fetch(`/routes/${this.routeIdTarget}/landmarks`, options)
        .then(response => response.text())
        .then((data) => {
          console.log(data);
          this.landmarksTarget.insertAdjacentHTML('beforeend', data);
        });
    });
  }
}
