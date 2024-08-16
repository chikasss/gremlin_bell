import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="current-location"
export default class extends Controller {
  connect() {
    console.log("current_location_controller connected")
  }

  searchByCurrentLocation() {
    console.log("clicked")
    navigator.geolocation.getCurrentPosition((position) => {
      console.log(position.coords.latitude, position.coords.longitude);
    });
  }

}
