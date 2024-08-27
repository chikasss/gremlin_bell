import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
  static values = { chatroomId: Number }
  static targets = ["messages"]

  connect() {
    this.subscription = createConsumer().subscriptions.create(
      { channel: "ChatroomChannel", id: this.chatroomIdValue },
      { received: data => this.insertMessageAndScrollDown(data) }
    )
    console.log(`Subscribed to the chatroom with the id ${this.chatroomIdValue}.`)
    
    // Scroll to bottom when chat is opened
    this.scrollToBottom()
  }
  
  insertMessageAndScrollDown(data) {
    this.messagesTarget.insertAdjacentHTML("beforeend", data)
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
