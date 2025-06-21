import { Application, Controller } from "@hotwired/stimulus";
import DisableButtonController from "./controllers/disable_button_controller.js";
import MoviesController from "./controllers/movies_controller.js";
window.Stimulus = Application.start();

// To change the button to Bingo and disabled

// // select the button
// const button = document.querySelector("#click-me");
// // Add an click event listener to the button
// button.addEventListener("click", () => {
//   // replace the inner text of the button to `Bingo!`
//   button.innerText = "Bingo!";
//   // disable the button
//   // button.setAttribute("disabled", "");
//   button.disabled = true;
// });

Stimulus.register("disable-button", DisableButtonController);
Stimulus.register("movies", MoviesController);
