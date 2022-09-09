import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="chatroom-subscription"
export default class extends Controller {
  static targets = ["messages"]
  static values = {
    chatroomId: Number, currentUserId: Number
  }

  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "ChatroomChannel", id: this.chatroomIdValue },
      { received: data => this.#insertMessageAndScrollDown(data) }
    )
    console.log(`Subscribed to chatroom with the id ${this.chatroomIdValue}.`)
  }

  #justifyClass(currentUserIsSender) {
    return currentUserIsSender ? "justify-content-end" : "justify-content-start"
  }

  #userStyleClass(currentUserIsSender) {
    console.log(currentUserIsSender ? "sender-style" : "receiver-style");
    return currentUserIsSender ? "sender-style" : "receiver-style"
  }

  #buildMessageElement(currentUserIsSender, message) {
    return `<div class="message-row d-flex ${this.#justifyClass(currentUserIsSender)}">
    <div class="${this.#userStyleClass(currentUserIsSender)}">
      ${message}
    </div>
    </div>`
  }

  #insertMessageAndScrollDown(data) {
    const currentUserIsSender = this.currentUserIdValue === data.sender_id
    console.log(data.sender_id);
    console.log(this.currentUserIdValue);
    const messageElement = this.#buildMessageElement(currentUserIsSender, data.message)
    this.messagesTarget.insertAdjacentHTML("beforeend", messageElement)
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
  }

  resetForm(event) {
    event.target.reset()
  }

  disconnect() {
    console.log("Unsubscribed from the chatroom")
    this.channel.unsubscribe()
  }
}
