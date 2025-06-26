import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = [
    "nameInput",
    "priceInput",
    "wishList",
    "wishForm",
    "categories",
    "ideasList",
  ];

  // Set categories select as a target
  connect() {
    // Run the fetch and insert logic when the page loads
    // Make a request to https://fakestoreapi.com/products/categories
    fetch("https://fakestoreapi.com/products/categories")
      .then((response) => {
        // Parse the JSON -> Array of Strings
        return response.json();
      })
      .then((categories) => {
        // Iterate over the array
        categories.forEach((category) => {
          // on each category, create a option element <option>text</option> (don't forget to capitalize)
          const categoryCapitalized =
            category.charAt(0).toUpperCase() + category.slice(1);
          const option = document.createElement("option");
          option.value = category;
          option.textContent = categoryCapitalized;

          // insert that option into the select element
          this.categoriesTarget.appendChild(option);
        });
      });
  }

  // Set name input as target
  // Set price input as target
  // Set wish list  as target
  // Set wish form as target

  // Add action to the wish form
  // write a function that is called when the event happens #addItem
  addItem(event) {
    // replace elements we query selected with the target
    // Prevent the default behavior of submit
    event.preventDefault();
    // Grab the name and the price user typed
    const name = this.nameInputTarget.value;
    const price = this.priceInputTarget.value;
    // Construct li in `<li>Macbook - €999</li>`
    const listItem = document.createElement("li");
    listItem.textContent = `${name} - €${price}`;
    // Insert the li into the ol
    this.wishListTarget.appendChild(listItem);
    // Clear the input field
    this.wishFormTarget.reset();
  }

  // Set ideas list as a target

  // set an action for the search form submission (#search)
  search(event) {
    event.preventDefault();
    // Once submitted
    const selectedCategory = this.categoriesTarget.value;
    // Clear the list
    this.ideasListTarget.innerHTML = "";
    // Make a request to the API
    fetch(`https://fakestoreapi.com/products/category/${selectedCategory}`)
      .then((response) => response.json())
      .then((products) => {
        // We get an array of product objects back
        // Iterate over the array
        products.forEach((product) => {
          // On each iteration
          const name = product.title;
          const price = product.price;
          // Make a li that looks like this <li class="mb-2">Macbook - €999 <button class="btn btn-primary btn-sm" data-action="gifts#addIdea">Add</button></li>
          // https://developer.mozilla.org/en-US/docs/Web/HTML/How_to/Use_data_attributes#javascript_access
          const li = document.createElement("li");
          li.classList.add("mb-2");
          li.textContent = `${name} - €${price}`;

          const button = document.createElement("button");
          button.classList.add("btn", "btn-primary", "btn-sm");
          button.textContent = "Add";

          // Write a logic that adds data-action="click->gifts#addIdea" to the button element
          button.setAttribute("data-action", "click->gifts#addIdea");
          // button.dataset.action = "click->gifts#addIdea"; equivalent to the above

          // Add two more data attributes to the button element
          // After adding those two data attributes, the element should look like this
          // <button class="btn btn-primary btn-sm" data-action="click->gifts#addIdea" data-gifts-name-param="Macbook" data-gifts-price-param="1000">
          //   Add
          // </button>
          button.dataset.giftsNameParam = name;
          button.dataset.giftsPriceParam = price;

          li.appendChild(button);

          // Insert that li into the unordered list
          this.ideasListTarget.appendChild(li);
        });
      });
  }

  addIdea(event) {
    // We lost access to name and price, so we pass them as params
    const name = event.params.name;
    const price = event.params.price;

    // Create a li element that looks like `<li>Macbook - €999</li>`
    const wishListItem = `<li>${name} - €${price}</li>`;
    // Insert that into the wish list
    this.wishListTarget.insertAdjacentHTML("beforeend", wishListItem);
    // Remove the li element that has just been added
    event.currentTarget.parentElement.remove();
  }
}
