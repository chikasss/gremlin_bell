import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="insert-route-comment"
export default class extends Controller {
  static targets = [ "commentForm", "insertCommentBtn" ]

  connect() {
    this.updateButtonText();
  }

  insertRouteComment() {
    this.commentFormTarget.classList.toggle('visible');
    this.updateButtonText();
  }

  updateButtonText() {
    if (this.commentFormTarget.classList.contains('visible')) {
      this.insertCommentBtnTarget.innerText = 'Cancel';
    } else {
      this.insertCommentBtnTarget.innerText = 'Insert a Route Comment';
    }
  }
}
