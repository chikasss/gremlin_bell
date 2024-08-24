import { Controller } from "@hotwired/stimulus"
import mapboxgl from "mapbox-gl"

// Connects to data-controller="mapbox-download"
export default class extends Controller {
  connect() {
    console.log("Hello from download controller")
    mapboxgl.accessTokey = this.data.get("accessToken");

    this.map = new mapboxgl.Map({
      center: [139.6503, 35.6762], // Default center
      zoom: 10, // Default zoom
      container: this.mapTarget,
      style: "mapbox://styles/chikas/cm00elyc0007101pw2mloe5uw",
    })

    // Parse and convert waypoints
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

    map.on("load", () => {
      this.getRoute(waypoints, map);
      content = map.getCanvas().toDataUrl();
      console.log(content)
    });
  }
  // Object.defineProperty(window, 'devicePixelRatio', {
  //   get: function() {return dpi / 96 }
  // })


}
