import { Controller } from "@hotwired/stimulus"


export default class extends Controller {
  static targets = ["prefectures", "rideTypeSearchButton", "searchBars", "pElement"]
  static values = {
    prefectures: Object
  }
  connect() {
    document.addEventListener('DOMContentLoaded', () => {
      this.expandRideTypes();
    });
  }

  //
  expandRideTypes() {
    this.searchBarsTarget.classList.toggle("visible");
    if (this.rideTypeSearchButtonTarget.classList.contains("fa-caret-down")) {
      this.rideTypeSearchButtonTarget.classList.remove("fa-caret-down");
      this.rideTypeSearchButtonTarget.classList.add("fa-caret-up");
    } else {
      this.rideTypeSearchButtonTarget.classList.add("fa-caret-down")
    }
  }


  expandPrefectures (event) {
    this.pElementTarget.innerText = "Next filter by Prefecture:";
    this.prefecturesTargets.forEach ( prefectureElement => {
      prefectureElement.classList.add("d-none")})


    this.prefecturesValue[event.currentTarget.innerText].forEach (prefecture => {
      this.prefecturesTargets.forEach (prefectureElement => {
        if (prefecture === prefectureElement.id) {
          prefectureElement.classList.remove("d-none")
        }
      })
    })
  }
}
