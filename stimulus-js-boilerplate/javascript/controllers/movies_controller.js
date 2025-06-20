import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["results", "input"];
  connect() {
    console.log(this.inputTarget);
    console.log(this.resultsTarget);
  }

  // Listen to the submission of the form
  // Get the value in the input to search for movies
  // Fetch movies from the OMDB API
  // Create cards from JSON
  // Insert them to the row

  // Targets
  // Place to insert results
  // Input field to get the value

  // Actions
  // Submit on form

  search(event) {
    event.preventDefault();
    this.resultsTarget.innerHTML = "";

    // Fetch movies from the OMDB API
    const url = `https://www.omdbapi.com/?s=${this.inputTarget.value}&apikey=48727053`;

    fetch(url)
      .then((response) => response.json())
      .then((data) => {
        const movies = data.Search;
        movies.forEach((movie) => {
          const card = `
            <li class="col list-group">
              <img src="${movie.Poster}" alt="${movie.Title}" class="img-fluid">
            </li>
          `;

          this.resultsTarget.insertAdjacentHTML("beforeend", card);
        });
      });
    // Create cards from JSON
    // Insert them to the row
  }
}
