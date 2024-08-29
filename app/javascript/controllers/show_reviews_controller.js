import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="show-reviews"
export default class extends Controller {
  static targets = [ "showReviewBtn", "showLastFiveReviews" ]

  connect() {
    this.initializeReviews();
  }

  initializeReviews() {
    this.showLastFiveReviewsTarget.classList.remove('visible');
    this.showReviewBtnTarget.innerText = 'Read Reviews';
  }

  showReviews() {
    this.showLastFiveReviewsTarget.classList.toggle('visible');
    if (this.showLastFiveReviewsTarget.classList.contains('visible')) {
      this.showReviewBtnTarget.innerText = 'Hide Reviews';
    } else {
      this.showReviewBtnTarget.innerText = 'Read Reviews';
    }
  }
}
