import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["list", "input"];
  connect() {
    console.log("hello from movies controller");
  }

  search(event) {
    event.preventDefault();

    // Select the ul
    const movieList = this.listTarget;
    // get the value typed in the input field
    const query = this.inputTarget.value;
    const url = `https://www.omdbapi.com/?s=${query}&apikey=48727053`;
    // Fetch the movie data
    fetch(url)
      .then((response) => response.json())
      .then((data) => {
        // iterate over the movies array
        const movies = data.Search;

        movies.forEach((movie) => {
          // on each iteration get the poster URL
          const posterUrl = movie.Poster;
          const poster = `
            <li class="col">
              <img src="${posterUrl}" />
            </li>
          `;

          // insert the image into the ul
          movieList.insertAdjacentHTML("beforeend", poster);
        });
      });
  }
}
