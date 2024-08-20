import { Controller } from "@hotwired/stimulus";
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder";
import mapboxgl from "mapbox-gl";

// Connects to data-controller="mapbox-search"
export default class extends Controller {
  static targets = ["map", "searchInput", "waypointsField"];

  connect() {
    mapboxgl.accessToken = "YOUR_MAPBOX_ACCESS_TOKEN";

    this.map = new mapboxgl.Map({
      container: this.mapTarget,
      style: "mapbox://styles/mapbox/streets-v11",
      center: [0, 0],
      zoom: 2,
    });

    this.geocoder = new MapboxGeocoder({
      accessToken: mapboxgl.accessToken,
      mapboxgl: mapboxgl,
      placeholder: "Search for a location",
    });

    this.searchInputTarget.appendChild(this.geocoder.onAdd(this.map));

    this.waypoints = [];

    this.geocoder.on("result", (event) => {
      const { geometry, place_name } = event.result;
      const { coordinates } = geometry;

      new mapboxgl.Marker()
        .setLngLat(coordinates)
        .setPopup(new mapboxgl.Popup().setText(place_name))
        .addTo(this.map);

      this.map.setCenter(coordinates);
      this.map.setZoom(12);

      this.waypoints.push(coordinates);
      this.waypointsFieldTarget.value = JSON.stringify(this.waypoints);
    });
  }
}
