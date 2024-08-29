import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="insert-route-comment"
export default class extends Controller {
  static targets = [ "commentForm", "insertCommentBtn" ]

  connect() {
    console.log('Connected to insert-post-comment controller!')
  }

  insertPostComment() {
    this.commentFormTarget.classList.toggle('visible');
  }
}
