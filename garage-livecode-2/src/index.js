// select the section of the page we want to insert the cards into.
const carsList = document.querySelector(".cars-list");
// Define the URL
const url = "https://garage.api.lewagon.com/1978/cars";
// Fetch the data from the URL
fetch(url)
  // We get the JSON back, we parse it
  .then((response) => response.json())
  .then((data) => {
    // We get an array of car objects, where each object has name, number plate, etc.
    // we iterate over the array
    data.forEach((car) => {
      // on every iteration, we make an individual car card
      const carCard = `
        <div class="car">
          <div class="car-image">
            <img src="https://image.pollinations.ai/prompt/${car.brand} ${car.model}" />
          </div>
          <div class="car-info">
            <h4>${car.brand} ${car.model}</h4>
            <p><strong>Owner:</strong> ${car.owner}</p>
            <p><strong>Plate:</strong> ${car.plate}</p>
          </div>
        </div>
      `;
      // we insert the card into the DOM
      carsList.insertAdjacentHTML("beforeend", carCard);
    });
  });
