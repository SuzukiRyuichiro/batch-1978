import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["button", "link"];
  static values = {
    buttonText: String,
  };
  // Reserved function that runs automatically when mounted
  connect() {
    console.log(this.element);
    console.log("Hello from disable button controller");
  }

  // custom
  disable() {
    const button = this.buttonTarget;
    const link = this.linkTarget;
    // Use the value dedicated for the controller
    button.innerText = this.buttonTextValue;
    button.disabled = true;

    // Display the link
    link.classList.remove("d-none");
  }

  reset() {
    const button = this.buttonTarget;
    const link = this.linkTarget;

    // change the text to click me
    button.innerText = "Click me";
    // enable the button
    button.disabled = false;
    // hide the reset again
    link.classList.add("d-none");
  }
}
