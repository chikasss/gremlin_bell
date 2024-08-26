import { Controller } from "@hotwired/stimulus"
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder";


export default class extends Controller {
  static values = { apiKey: String }
  static targets = ["address", "long", "lat"]

  connect() {
    console.log("landmark controller connected")

    const mapboxAccessToken = this.element.dataset.mapboxApiKey;
    mapboxgl.accessToken = mapboxAccessToken;

    this.geocoder = new MapboxGeocoder({
    accessToken: mapboxgl.accessToken,
     //accessToken: this.apiKeyValue,
      types: "country,region,place,postcode,locality,neighborhood,address",
      placeholder: 'Search landmarks',
      className: 'custom-geocoder'
    })

    this.geocoder.addTo(this.element)
    this.geocoder.on("result", event => this.#handleResult(event))
    this.geocoder.on("clear", () => this.#clearInputValue())
    this.index = this.addressTargets.length
  }

  // addLandmark(event) {
  //   event.preventDefault()
  //   const template = document.querySelector('#landmark-template').content.cloneNode(true)
  //   template.querySelectorAll('input').forEach(input => {
  //     input.name = input.name.replace(/\[\d+\]/, `[${this.index}]`)
  //   })
  //   this.element.querySelector('.add-landmark').insertAdjacentElement('beforebegin', template)
  //   this.index++
  // }

  // removeLandmark(event) {
  //   event.preventDefault()
  //   event.target.closest('.landmark-fields').remove()
  // }


  #handleResult(event) {
    const result = event.result
    console.log("result:", result);

    this.addressTarget.value = result["place_name"]

    const coordinates = result.geometry.coordinates
    console.log("Coordinates:", coordinates);
    this.latTarget.value = coordinates[1] // latitude
    this.longTarget.value = coordinates[0] // longitud
    //this.element.dataset.landmarkCoordinates = JSON.stringify(coordinates);
    console.log("long, lat:", coordinates[1], coordinates[0])
    this.#addLandmarkToMap(coordinates);

  }

  #addLandmarkToMap(coordinates) {
    const mapControllerElement = document.querySelector('[data-controller="map"]');
    if (mapControllerElement) {
      mapControllerElement.dispatchEvent(new CustomEvent('landmark:add', {
        detail: { coordinates: coordinates }
      }));
    }
  }

  #clearInputValue() {
    this.addressTarget.value = ""
  }

  disconnect() {
    this.geocoder.onRemove()
  }
}
