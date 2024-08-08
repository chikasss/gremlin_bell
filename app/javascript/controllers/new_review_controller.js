import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="new-review"
export default class extends Controller {
  static targets = [ "writeReviewBtn", "reviewForm" ]
  connect() {
    document.addEventListener('DOMContentLoaded', () => {
      this.newReview();
    });
  }

  newReview() {
    this.reviewFormTarget.classList.toggle('visible');
    if (this.reviewFormTarget.classList.contains('visible')) {
      this.writeReviewBtnTarget.innerText = 'Cancel';
    } else {
      this.writeReviewBtnTarget.innerText = 'Write a Route Review';
    }
  }
}
