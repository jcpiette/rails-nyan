import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="avatar"
export default class extends Controller {
  static targets = ["avatar", "file"];
  connect() {
  }

  showFileInterface(e) {
    console.log("clicking on avatar");
    console.log(this.fileTarget);
    this.fileTarget.click();
  }
}
