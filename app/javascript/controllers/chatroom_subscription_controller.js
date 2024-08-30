import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
  static values = { chatroomId: Number, currentUserId: Number }
  static targets = ["messages"]

  connect() {
    if (this.subscription) {
      this.subscription.unsubscribe();
    }

    this.subscription = createConsumer().subscriptions.create(
      { channel: "ChatroomChannel", id: this.chatroomIdValue },
      {
        received: data => this.insertMessageAndScrollDown(data),
      }
    );

    this.scrollToBottom();
    this.applyClassesToMessages();
  }

  insertMessageAndScrollDown(data) {
    const parser = new DOMParser();
    const doc = parser.parseFromString(data.message, "text/html");
    const messageElement = doc.body.firstChild;

    const isCurrentUser = data.user_id === this.currentUserIdValue;
    messageElement.classList.add(isCurrentUser ? 'sender' : 'receipt');

    this.messagesTarget.appendChild(messageElement);
    this.scrollToBottom();
  }

  applyClassesToMessages() {
    this.messagesTarget.querySelectorAll('.message').forEach((messageElement) => {
      const userId = parseInt(messageElement.dataset.userId, 10);
      const isCurrentUser = userId === this.currentUserIdValue;
      messageElement.classList.add(isCurrentUser ? 'sender' : 'receipt');
    });
  }

  scrollToBottom() {
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight);
  }

  resetForm(event) {
    event.target.reset();
  }
}
