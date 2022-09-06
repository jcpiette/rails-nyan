import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="notification-subscription"
export default class extends Controller {
  static values = { notificationId: Number }
  static targets = ["notifications"]

  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "NotificationChannel", id: this.notificationIdValue },
      { received: data => console.log(data) }
    )
  }

  disconnect() {
    console.log("Unsubscribed from the notification")
    this.channel.unsubscribe()
  }
}