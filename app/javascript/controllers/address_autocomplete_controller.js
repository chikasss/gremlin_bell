// import { Controller } from "@hotwired/stimulus"
//import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder";

// Connects to data-controller="address-autocomplete"
// export default class extends Controller {
//   static values = { apiKey: String }
//   static targets = ["address"]

  // connect() {
    // this.geocoder = new MapboxGeocoder({
    //   accessToken: this.apiKeyValue,
    //   types: "country,region,place,postcode,locality,neighborhood,address",
    //   placeholder: 'Search for places',
    // })

  //   this.geocoder.addTo(this.element)
  //   this.geocoder.on("result", event => this.#handleResult(event))
  //   this.geocoder.on("clear", () => this.#clearInputValue())
  // }

  // #handleResult(event) {
  //   this.addressTarget.value = event.result["place_name"]

  //   const mapController = document.querySelector('[data-controller="map"]').__stimulus.controllers[0];
  //   if (mapController) {
  //     mapController.updateMap(event.result.geometry.coordinates);
  //   }
  // }

  // #clearInputValue() {
  //   this.addressTarget.value = ""
  // }

  // disconnect() {
  //   this.geocoder.onRemove()
  // }

// }
