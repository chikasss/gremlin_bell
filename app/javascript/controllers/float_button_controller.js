import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["button", "icon", "alert"];

  connect() {
    const controllerName = document.body.dataset.controllerName;
    const actionName = document.body.dataset.actionName;

    if (controllerName === 'chatrooms' && (actionName === 'show' || actionName === 'new')) {
      this.buttonTarget.style.backgroundColor = 'rgba(250, 250, 250, 0)';
      this.buttonTarget.style.boxShadow = 'none';
      this.iconTarget.style.opacity = '0.3';
      this.alertTarget.style.display = 'none';
    }
  }
}
