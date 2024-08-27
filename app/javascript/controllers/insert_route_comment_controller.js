import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="insert-route-comment"
export default class extends Controller {
  static targets = [ "commentForm", "insertCommentBtn", "newCommentBtn" ]

  connect() {
    this.updateButtonText();
  }

  insertRouteComment() {
    this.commentFormTarget.classList.toggle('visible');
    this.updateButtonText();
  }

  updateButtonText() {
    if (this.commentFormTarget.classList.contains('visible')) {
      this.newCommentBtnTarget.innerText = 'Cancel';
    } else {
      this.newCommentBtnTarget.innerText = 'Write your own comment or question';
    }
  }
}
