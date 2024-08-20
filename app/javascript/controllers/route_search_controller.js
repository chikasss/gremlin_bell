import { Controller } from "@hotwired/stimulus"


export default class extends Controller {
  static targets = ["prefectures"]
  static values = {
    prefectures: Object
  }
  connect() {

  }

  expandPrefectures (event) {
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
