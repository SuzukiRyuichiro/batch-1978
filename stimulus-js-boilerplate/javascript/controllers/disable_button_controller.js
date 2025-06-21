import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["button", "link"];
  static values = {
    text: String,
  };

  connect() {
    console.log("hello from disable button controller");
  }

  disable() {
    // Disable the button that was clicked
    // get the element (button)
    // const button = this.element; // refers to the element the controller was mounted on

    // how to refer to target this.[name]Target
    const button = this.buttonTarget;
    // change the inner text
    button.innerText = this.textValue;
    // disable the button
    button.setAttribute("disabled", "");

    // reveal the link
    const resetLink = this.linkTarget;
    // remove the d-none class
    resetLink.classList.remove("d-none");
  }

  reset() {
    // Get the button element
    const button = this.buttonTarget;
    // Enable the button back
    button.disabled = false;
    // Bring the text back to the original
    button.innerText = "Click me!";
    // Hide the reset link again (add d-none)
    this.linkTarget.classList.add("d-none");
  }
}
