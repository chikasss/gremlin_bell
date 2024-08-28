import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="like"
export default class extends Controller {
  static targets = ["likeCount", "likeButton", "likeContainer"]

  toggleLike(event) {
    event.preventDefault();

    const button = event.currentTarget;
    const form = button.closest('form');
    const url = form.getAttribute('action');
    const method = button.dataset.method.toUpperCase();
    // console.log('URL:', url);
    // console.log('Method:', method);
    this.fetchLike(url, method);
  }

  fetchLike(url, method) {
    fetch(url, {
      method: method,
      headers: {
        'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').getAttribute('content'),
        'Accept': 'application/json'
      }
    })
    .then(response => response.json())
    .then(data => {
      this.likeContainerTarget.outerHTML = data.like_button_html;
    });
  }  
}
