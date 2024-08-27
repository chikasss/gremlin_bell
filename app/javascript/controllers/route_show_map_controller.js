import { Controller } from "@hotwired/stimulus"
import mapboxgl from "mapbox-gl";

// Connects to data-controller="route-show-map"
export default class extends Controller {
  static targets = ["map"];

  connect() {
    mapboxgl.accessToken = this.data.get("accessToken");

    const map = new mapboxgl.Map({
      container: this.mapTarget,
      style: "mapbox://styles/chikas/cm00elyc0007101pw2mloe5uw",
      center: [139.6503, 35.6762], // Default center
      zoom: 10, // Default zoom
    });

    map.addControl(
      new mapboxgl.GeolocateControl({
        positionOptions: {
          enableHighAccuracy: true
        },
        trackUserLocation: true,
        showUserHeading: false
      }),
      'top-left'
    );

    // Parse and convert waypoints

    map.on("load", () => {

      this.waypoints = JSON.parse(this.data.get("waypoints")).map(([lng, lat]) =>
        [parseFloat(lng), parseFloat(lat)]);

      console.log("map on waypoints:", this.waypoints)
      // Add markers for waypoints
      this.waypoints.forEach((waypoint, index) => {
        new mapboxgl.Marker({
          element: this.createCustomMarkerElement(index)
        })
          .setLngLat(waypoint)
          .addTo(map);
      });

      const landmarks = JSON.parse(this.data.get("landmarks"));
      landmarks.forEach((landmark) => {
        const landmarkCoords = [parseFloat(landmark.long), parseFloat(landmark.lat)];
        new mapboxgl.Marker({
          element: this.createLandmarkCustomMarkerElement()
        })
          .setLngLat(landmarkCoords)
          .addTo(map);
        });
        this.getRoute(this.waypoints, map);
    });
  }

   // Create custom marker element
   createCustomMarkerElement(id) {
    const el = document.createElement('div');
    el.id = `marker-${id}`
    el.className = 'custom-marker';
    console.log("waypoints:", this.waypoints)
    //el.style.backgroundImage =  `url(${this.data.get("logoUrl")})`;
    if (id == 0) {
      el.style.backgroundImage = `url(${this.data.get("pinBlue")})`
    }
    else if (id == this.waypoints.length - 1){
      el.style.backgroundImage =  `url(${this.data.get("logoUrl")})`
    }
    else {
      el.style.backgroundImage = `url(${this.data.get("pinYellow")})`;
    }
    el.style.width = '32px'; // Size of the icon
    el.style.height = '32px';
    el.style.backgroundSize = '100%';
    return el;
    }

    createLandmarkCustomMarkerElement() {
      const el = document.createElement('div');
      el.className = 'custom-marker';
      el.style.backgroundImage =  `url(${this.data.get("pinPurple")})`; // URL to your custom icon
      el.style.width = '32px'; // Size of the icon
      el.style.height = '32px';
      el.style.backgroundSize = '100%';
      return el;
      }

  async getRoute(waypoints, map) {
    // Directions API
    const coordinates = waypoints.map(([lng, lat]) => `${lng},${lat}`).join(';');
    const directionsUrl = `https://api.mapbox.com/directions/v5/mapbox/driving/${coordinates}?geometries=geojson&access_token=${mapboxgl.accessToken}`;

    try {
      const response = await fetch(directionsUrl);
      const data = await response.json();
      const route = data.routes[0].geometry.coordinates;

      // Create the route
      const geojson = {
        type: 'Feature',
        properties: {},
        geometry: {
          type: 'LineString',
          coordinates: route
        }
      };

      if (map.getSource('route')) {
        map.getSource('route').setData(geojson);
      } else {
        map.addSource('route', {
          type: 'geojson',
          data: geojson
        });

        map.addLayer({
          id: 'route',
          type: 'line',
          source: 'route',
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

      const bounds = new mapboxgl.LngLatBounds();
      route.forEach(([lng, lat]) => bounds.extend([lng, lat]));
      map.fitBounds(bounds, { padding: 40 });

    } catch (error) {
      console.error('Error fetching directions:', error);
    }
  }
}
