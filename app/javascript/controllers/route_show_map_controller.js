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

    // Parse and convert waypoints

    map.on("load", () => {

      let waypoints = JSON.parse(this.data.get("waypoints")).map(([lng, lat]) =>
        [parseFloat(lng), parseFloat(lat)]);

      // Add markers for waypoints
      waypoints.forEach((waypoint) => {
        new mapboxgl.Marker({
          element: this.createCustomMarkerElement()
        })
          .setLngLat(waypoint)
          .addTo(map);
      });

      ////Add marker for landmark
      // const landmarkLng = parseFloat(this.data.get("landmarkLong"));
      // const landmarkLat = parseFloat(this.data.get("landmarkLat"));
      // const landmarkCoords = [landmarkLng, landmarkLat];

      // console.log("LandmarkCoords:", landmarkCoords)

      const landmarks = JSON.parse(this.data.get("landmarks"));
      landmarks.forEach((landmark) => {
        const landmarkCoords = [parseFloat(landmark.long), parseFloat(landmark.lat)];
        new mapboxgl.Marker({
          element: this.createLandmarkCustomMarkerElement()
        })
          .setLngLat(landmarkCoords)
          .addTo(map);
        });

        this.getRoute(waypoints, map);
    });
  }

   // Create custom marker element
   createCustomMarkerElement() {
    const el = document.createElement('div');
    el.className = 'custom-marker';
    el.style.backgroundImage =  `url(${this.data.get("logoUrl")})`; // URL to your custom icon
    el.style.width = '32px'; // Size of the icon
    el.style.height = '32px';
    el.style.backgroundSize = '100%';
    return el;
    }

    createLandmarkCustomMarkerElement() {
      const el = document.createElement('div');
      el.className = 'custom-marker';
      el.style.backgroundImage =  `url(${this.data.get("landmarkLogoUrl")})`; // URL to your custom icon
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
