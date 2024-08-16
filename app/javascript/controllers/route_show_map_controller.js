import { Controller } from "@hotwired/stimulus"
import mapboxgl from "mapbox-gl";

// Connects to data-controller="route-show-map"
export default class extends Controller {
  static targets = ["map"];
  connect() {
    mapboxgl.accessToken = this.data.get("accessToken");

    const map = new mapboxgl.Map({
      container: this.mapTarget,
      style: "mapbox://styles/mapbox/streets-v11",
      center: [139.6503, 35.6762], // Default center
      zoom: 10, // Default zoom
    });

    // Parse and convert waypoints
    let waypoints = JSON.parse(this.data.get("waypoints")).map(([lng, lat]) =>
      [parseFloat(lng), parseFloat(lat)]);

    waypoints.forEach((waypoint) => {
      new mapboxgl.Marker()
        .setLngLat(waypoint)
        .addTo(map);
    });

    map.on("load", () => {
      map.addSource("route", {
        type: "geojson",
        data: {
          type: "Feature",
          properties: {},
          geometry: {
            type: "LineString",
            coordinates: waypoints,
          },
        },
      });

      map.addLayer({
        id: "route",
        type: "line",
        source: "route",
        layout: {
          "line-join": "round",
          "line-cap": "round",
        },
        paint: {
          "line-color": "#FF0000",
          "line-width": 4,
        },
      });

      const bounds = new mapboxgl.LngLatBounds();
      waypoints.forEach((waypoint) => {
        bounds.extend(waypoint);
      });
      map.fitBounds(bounds, { padding: 40 });
    });
  }
}
