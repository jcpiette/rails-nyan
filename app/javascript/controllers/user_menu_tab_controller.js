import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="user-menu-tab"
export default class extends Controller {
  static targets = ["userInfo", "button", "address", "preference","notification","tab-selected"]

  connect() {
    console.log("connected to user menu");
    console.log(this.userInfoTarget);
  }

  displayAccount(e) {
    e.preventDefault();
    console.log(this.userInfoTarget);
    this.addressTarget.style.display = "none";
    this.userInfoTarget.style.display = "block";
    this.preferenceTarget.style.display = "none";
    this.notificationTarget.style.display = "none";
    this.buttonTargets.forEach((button) => {
      button.classList.remove("tab-selected");
    })
    e.target.classList.add("tab-selected");
  }

  displayAddress(e) {
    e.preventDefault();
    console.log(this.addressTarget);
    this.addressTarget.style.display = "block";
    this.userInfoTarget.style.display = "none";
    this.preferenceTarget.style.display = "none";
    this.notificationTarget.style.display = "none";
    this.buttonTargets.forEach((button) => {
      button.classList.remove("tab-selected");
    })
    e.target.classList.add("tab-selected");
  }

  displayPreference(e) {
    e.preventDefault();
    console.log(this.preferenceTarget);
    this.preferenceTarget.style.display = "block";
    this.userInfoTarget.style.display = "none";
    this.addressTarget.style.display = "none";
    this.notificationTarget.style.display = "none";
    this.buttonTargets.forEach((button) => {
      button.classList.remove("tab-selected");
    })
    e.target.classList.add("tab-selected");
  }

  displayNotification(e) {
    e.preventDefault();
    console.log(this.notificationTarget);
    this.notificationTarget.style.display = "block";
    this.userInfoTarget.style.display = "none";
    this.addressTarget.style.display = "none";
    this.preferenceTarget.style.display = "none";
    this.buttonTargets.forEach((button) => {
      button.classList.remove("tab-selected");
    })
    e.target.classList.add("tab-selected");

  }
}
