import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="notification-subscription"
export default class extends Controller {
  static values = { notificationId: Number }
  static targets = ["notifications", "notificationsMessage", "notificationsCount"]

  connect() {
    console.log("connect to notif room");
    console.log(this.notificationIdValue);

    this.channel = createConsumer().subscriptions.create(
      { channel: "NotificationChannel", id: this.notificationIdValue },
      { received: data => this.addMessage(data) }
    )
  }

  disconnect() {
    console.log("Unsubscribed from the notification")
    this.channel.unsubscribe()
  }

  addMessage(data) {
    this.notificationsCountTarget.innerText = parseInt(this.notificationsCountTarget.innerText) + 1;
    this.notificationsTarget.style = "background-color:red;"
    this.notificationsMessageTarget.insertAdjacentHTML("afterbegin", data);
  }
}
