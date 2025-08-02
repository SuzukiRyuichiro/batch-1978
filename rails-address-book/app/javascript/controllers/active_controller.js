import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="active"
export default class extends Controller {
  connect() {}

  activate(event) {
    // Erase all active
    [...this.element.children].forEach((element) => {
      element.classList.remove("active");
    });
    // add active to the clicked element
    event.currentTarget.classList.add("active");
  }
}
