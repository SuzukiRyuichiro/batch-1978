const students = document.querySelector("#students");

// Insert another student into the list
students.insertAdjacentHTML("beforeend", "<li>Sunny</li>");

// Get fifa winners

const winners = document.querySelectorAll("ol#fifa-wins li");

// Manipulate CSS using JS
const winnersList = document.querySelector("#fifa-wins");

winnersList.style.color = "red";

// I want to change the text Fifa wins to green
// using .green class

// Select the h2
const h2 = document.querySelector("h2");
// on the h2, add the class of green
h2.classList.add("green");
