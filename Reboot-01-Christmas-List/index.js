// Select the inputs name and the price
const nameInput = document.querySelector("#name");
const priceInput = document.querySelector("#price");
// Select the ordered list
const wishList = document.querySelector("#wish-list");
// Select the form
const wishForm = document.querySelector("#wish-form");

// Add event listener for the form submit
wishForm.addEventListener("submit", (event) => {
  // Prevent the default behavior of submit
  event.preventDefault();
  // Grab the name and the price user typed
  const name = nameInput.value;
  const price = priceInput.value;
  // Construct li in `<li>Macbook - €999</li>`
  const listItem = document.createElement("li");
  listItem.textContent = `${name} - €${price}`;
  // Insert the li into the ol
  wishList.appendChild(listItem);
  // Clear the input field
  wishForm.reset();
});

// Populating the category options
// Select the categories select element
const categoriesSelect = document.querySelector("#categories");

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
      categoriesSelect.appendChild(option);
    });
  });

// Searching and inserting results
// Select the <select> already available
// Select the search form
const searchForm = document.querySelector("#search-form");
// Select the unordered list
const ideasList = document.querySelector("#ideas");

// Add event listener on submit
searchForm.addEventListener("submit", (event) => {
  event.preventDefault();
  // Once submitted
  const selectedCategory = categoriesSelect.value;
  // Clear the list
  ideasList.innerHTML = "";
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
        // Make a li that looks like this <li class="mb-2">Macbook - €999 <button class="btn btn-primary btn-sm">Add</button></li>
        const li = document.createElement("li");
        li.classList.add("mb-2");
        li.textContent = `${name} - €${price}`;

        const button = document.createElement("button");
        button.classList.add("btn", "btn-primary", "btn-sm");
        button.textContent = "Add";

        // Add event listener
        button.addEventListener("click", () => {
          // Create a li element that looks like `<li>Macbook - €999</li>`
          const wishListItem = `<li>${name} - €${price}</li>`;
          // Insert that into the wish list
          wishList.insertAdjacentHTML("beforeend", wishListItem);
          // Remove the li element that has just been added
          li.remove();
        });

        li.appendChild(button);

        // Insert that li into the unordered list
        ideasList.appendChild(li);
      });
    });
});
