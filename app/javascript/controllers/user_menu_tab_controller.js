import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="user-menu-tab"
// showing diferent menus in the same page
export default class extends Controller {
  static targets = ["userInfo", "button", "address", "preference","notification","tab-selected"] //<-----Check userMenu.html.erb

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
    this.buttonTargets.forEach((button) => {  //<------Remove bold selection when select different menu
      button.classList.remove("tab-selected");
    })
    e.target.classList.add("tab-selected");//<------Make it Bold when click it
  }

  displayAddress(e) {
    e.preventDefault();
    console.log(this.addressTarget);
    this.addressTarget.style.display = "block";
    this.userInfoTarget.style.display = "none";
    this.preferenceTarget.style.display = "none";
    this.notificationTarget.style.display = "none";
    this.buttonTargets.forEach((button) => { //<------Remove bold selection when select different menu
      button.classList.remove("tab-selected");
    })
    e.target.classList.add("tab-selected");//<------Make it Bold when click it
  }

  displayPreference(e) {
    e.preventDefault();
    console.log(this.preferenceTarget);
    this.preferenceTarget.style.display = "block";
    this.userInfoTarget.style.display = "none";
    this.addressTarget.style.display = "none";
    this.notificationTarget.style.display = "none";
    this.buttonTargets.forEach((button) => { //<------Remove bold selection when select different menu
      button.classList.remove("tab-selected");
    })
    e.target.classList.add("tab-selected");//<------Make it Bold when click it
  }

  displayNotification(e) {
    e.preventDefault();
    console.log(this.notificationTarget);
    this.notificationTarget.style.display = "block";
    this.userInfoTarget.style.display = "none";
    this.addressTarget.style.display = "none";
    this.preferenceTarget.style.display = "none";
    this.buttonTargets.forEach((button) => {
      button.classList.remove("tab-selected"); //<------Remove bold selection when select different menu
      e.target.classList.add("tab-selected");//<------Make it Bold when click it
    });
 }
}
