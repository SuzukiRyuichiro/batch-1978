import { Application, Controller } from "@hotwired/stimulus";
import DisableButtonController from "./controllers/disable_button_controller.js";
import MoviesController from "./controllers/movies_controller.js";
window.Stimulus = Application.start();

// OLD WAY
// const button = document.querySelector("#click-me");

// button.addEventListener("click", () => {
//   // Remove the primary class
//   button.classList.remove("btn-primary");
//   // Add danger class
//   button.classList.add("btn-danger");
//   // change the text
//   button.innerText = "Bingo!";
// });

Stimulus.register("disable-button", DisableButtonController);
Stimulus.register("movies", MoviesController);
