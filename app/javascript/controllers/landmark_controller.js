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


  #handleResult(event) {
    const result = event.result

    console.log("Extracted place_name:", result["place_name"]);

    // this.addressTarget.value = result["place_name"]

    const coordinates = result.geometry.coordinates
    const address = result["place_name"];

    console.log("Landmarks Coordinates:", coordinates);
    console.log("Landmark Address:", address);

    this.#addLandmarkFields(address, coordinates);

    this.#displaySelectedAddress(address);

    this.latTarget.value = coordinates[1] // latitude
    this.longTarget.value = coordinates[0] // longitud
    //this.element.dataset.landmarkCoordinates = JSON.stringify(coordinates);
    this.#addLandmarkToMap(coordinates, address);

  }

  #displaySelectedAddress(address) {
    const addressContainer = document.getElementById('selected-address-container');
    const addressItem = document.createElement('p');

    const landmarkIcon = document.createElement('img');
    landmarkIcon.src = addressContainer.dataset.landmarkPinPurple;
    landmarkIcon.alt = 'Landmark';
    landmarkIcon.style.width = '30px';
    landmarkIcon.style.height = '30px';
    landmarkIcon.style.marginRight = '4px';

    addressItem.innerHTML = `${address}`;
    const firstPartOfAddress = address.split(",")[0];
    addressItem.innerHTML = `${firstPartOfAddress}`;

    addressItem.prepend(landmarkIcon);

    addressContainer.appendChild(addressItem);
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

  #addLandmarkToMap(coordinates, address) {
    const mapControllerElement = document.querySelector('[data-controller="map"]');
    if (mapControllerElement) {
      mapControllerElement.dispatchEvent(new CustomEvent('landmark:add', {
        detail: {
          coordinates: coordinates,
        address: address
       }
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
