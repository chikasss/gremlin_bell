import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="current-location"
export default class extends Controller {
  static targets = ["waypointsInput"]

  connect() {
    console.log("current_location_controller connected")
  }


  searchByCurrentLocation() {
    console.log("clicked")
    navigator.geolocation.getCurrentPosition((position) => {
      console.log(position.coords.latitude, position.coords.longitude);
    });
  }

  startTracking() {
    console.log("Tracking started");

    navigator.geolocation.watchPosition((position) => {
      const lat = position.coords.latitude;
      const lng = position.coords.longitude;
      const waypoint = [lng, lat];

      this.waypoints.push(waypoint);
      this.updateMapWithWaypoints(waypoint);

      this.waypointsInputTarget.value =
      JSON.stringify(this.waypoints);
      }, (error) => {
        console.error("Error getting location", error);
      }, {
        enableHighAccuracy: true,
        maximumAge: 0,
        timeout: 5000
      });
  }

  updateMapWithWaypoints(waypoint) {
    // connect with route_show_map_controller
    const event = new CustomEvent("waypoint:added",
      { detail: { waypoint: waypoint } });
    this.element.dispatchEvent(event);
  }

}
