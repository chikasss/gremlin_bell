import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["fileInput", "submitButton"]

  selectFile() {
    this.fileInputTarget.click();
  }

  submitForm() {
    if (this.fileInputTarget.value) {
      this.submitButtonTarget.click();
    }
  }
}
