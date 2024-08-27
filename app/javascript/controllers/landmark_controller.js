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
      types: "poi",
      placeholder: 'Search landmarks',
      className: 'custom-geocoder',
      countries: 'jp',
    })

    this.geocoder.addTo(this.element)
    this.geocoder.on("result", event => this.#handleResult(event))
    this.geocoder.on("clear", () => this.#clearInputValue())
    this.index = this.addressTargets.length
  }

  // addLandmark(event) {
  //   event.preventDefault();
  //   const newId = new Date().getTime();  // Generate a unique ID
  //   const template = document.querySelector('#landmark-template').innerHTML;

  //   // Replace any placeholders in the template with a unique ID
  //   const newField = template.replace(/new_landmarks/g, newId);

  //   // Insert the new set of fields into the form
  //   this.element.insertAdjacentHTML('beforeend', newField);

  //   this.application.getControllerForElementAndIdentifier(this.element, "landmark").connect();

  // }

  // removeLandmark(event) {
  //   event.preventDefault()
  //   event.target.closest('.landmark-fields').remove()
  // }


  #handleResult(event) {
    const result = event.result

    // this.addressTarget.value = result["place_name"]

    const coordinates = result.geometry.coordinates
    console.log("Landmarks Coordinates:", coordinates);

    this.#addLandmarkFields(result["place_name"], coordinates);

    this.latTarget.value = coordinates[1] // latitude
    this.longTarget.value = coordinates[0] // longitud
    //this.element.dataset.landmarkCoordinates = JSON.stringify(coordinates);
    this.#addLandmarkToMap(coordinates);

  }

  #addLandmarkFields(address, coordinates) {
    // Generate a new ID for each landmark
    const newId = new Date().getTime();

    // Create new landmark fields dynamically
    const newFieldHTML = `
      <div class="landmark-fields">
        <input type="hidden" name="route[landmarks_attributes][${newId}][address]" value="${address}" />
        <input type="hidden" name="route[landmarks_attributes][${newId}][lat]" value="${coordinates[1]}" />
        <input type="hidden" name="route[landmarks_attributes][${newId}][long]" value="${coordinates[0]}" />
      </div>
    `;

    document.getElementById('landmark-fields-container').insertAdjacentHTML('beforeend', newFieldHTML);
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
