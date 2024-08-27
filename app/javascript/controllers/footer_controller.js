import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="footer"
export default class extends Controller {
  static targets = ["icon", "link"]

  connect() {
    this.updateActiveIcon()
  }

  updateActiveIcon() {
    this.iconTargets.forEach(icon => {
      if (icon.dataset.page === window.location.pathname) {
        icon.classList.add('active-bg')
      } else {
        icon.classList.remove('active-bg')
      }
    })
    this.linkTargets.forEach(link => {
      if (link.dataset.page === window.location.pathname) {
        link.classList.remove('white')
        link.classList.add('red')
      } else {
        link.classList.add('white')
        link.classList.remove('red')
      }
    })
  }
}