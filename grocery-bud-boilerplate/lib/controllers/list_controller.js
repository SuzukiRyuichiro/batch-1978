import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["form", "input", "groceries"];

  connect() {
    console.log("hello from list controller!");
    console.log(this.formTarget);
    console.log(this.inputTarget);
    console.log(this.groceriesTarget);
  }

  // We need to listen to the form submission
  // We need to know what is the item that's currently typed into the field
  // We need to have an access to the ul

  // Targets
  // - form
  // - input
  // - ul

  // Actions
  // - form: submit
  add(event) {
    event.preventDefault();
    // Get the value of the input
    const inputValue = this.inputTarget.value;
    // Create a li with the value inside (class="list-group-item")
    const liElement = `<li class="list-group-item">${inputValue}</li>`;
    // Insert it to the groceries target
    this.groceriesTarget.insertAdjacentHTML("beforeend", liElement);
    // Reset the form
    this.formTarget.reset();
  }
}
