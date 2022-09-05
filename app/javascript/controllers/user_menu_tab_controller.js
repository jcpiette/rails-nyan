import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="user-menu-tab"
export default class extends Controller {
  connect() {
  }

  displayAccount() {
    alert("account");
  }

  displayAddress() {
    alert("address");
  }

  displayPreference() {
    alert("prefe");
  }

  displayNotification() {
    alert("notif");
  }
}
