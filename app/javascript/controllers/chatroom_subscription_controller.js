import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
  static values = { chatroomId: Number, currentUserId: Number }
  static targets = ["messages"]

  connect() {
    this.subscription = createConsumer().subscriptions.create(
      { channel: "ChatroomChannel", id: this.chatroomIdValue },
      { received: data => this.insertMessageAndScrollDown(data) }
    )
    console.log(`Subscribed to the chatroom with the id ${this.chatroomIdValue}.`)
    this.scrollToBottom()
  }

  insertMessageAndScrollDown(data) {
    console.log(`Received message from user ID: ${data.user_id}`)
    console.log(`Current user ID: ${this.currentUserIdValue}`)

    const parser = new DOMParser()
    const doc = parser.parseFromString(data.message, "text/html")
    const newMessage = doc.querySelector(`[id^="message-"]`)

    if (data.user_id === this.currentUserIdValue) {
      newMessage.classList.add('sender')
    } else {
      newMessage.classList.add('receipt')
    }

    this.messagesTarget.insertAdjacentHTML("beforeend", newMessage.outerHTML)
    this.scrollToBottom()
  }

  scrollToBottom() {
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
  }

  resetForm(event) {
    event.target.reset()
  }
}



// import { Controller } from "@hotwired/stimulus"
// import { createConsumer } from "@rails/actioncable"

// export default class extends Controller {
//   static values = { chatroomId: Number }
//   static targets = ["messages"]

//   connect() {
//     this.subscription = createConsumer().subscriptions.create(
//       { channel: "ChatroomChannel", id: this.chatroomIdValue },
//       { received: data => this.insertMessageAndScrollDown(data.message) }
//     )
//     console.log(`Subscribed to the chatroom with the id ${this.chatroomIdValue}.`)
//   }
  
//   insertMessageAndScrollDown(message) {
//     const isCurrentUser = message.user_id === this.currentUserId
//     const messageElement = document.createElement("div")
//     messageElement.id = `message-${message.id}`
//     messageElement.className = isCurrentUser ? 'receipt' : 'sender'
//     messageElement.innerHTML = `
//       <p>${message.description}</p>
//       <small>${message.created_at}</small>
//     `

//     this.messagesTarget.appendChild(messageElement)
//     this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
//   }

//   resetForm(event) {
//     event.target.reset()
//   }
// }
