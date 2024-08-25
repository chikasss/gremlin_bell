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
      placeholder: 'Search for landmarks',
      className: 'custom-geocoder'
    })

    this.geocoder.addTo(this.element)
    this.geocoder.on("result", event => this.#handleResult(event))
    this.geocoder.on("clear", () => this.#clearInputValue())
  }

  #handleResult(event) {
    const result = event.result
    console.log("result:", result);

    this.addressTarget.value = result["place_name"]

    const coordinates = result.geometry.coordinates
    console.log("Coordinates:", coordinates);
    this.latTarget.value = coordinates[1] // latitude
    this.longTarget.value = coordinates[0] // longitud
    console.log("long, lat:", coordinates[1], coordinates[0])

  }

  #clearInputValue() {
    this.addressTarget.value = ""
  }

  disconnect() {
    this.geocoder.onRemove()
  }
}
