// Fetch all cars from the API
// Iterate over the response
// For each car in the garage, make a card and insert HTML

const GARAGE = "prepping";

const insertCar = (carInfo, parent) => {
  // Create the card HTML
  const card = `
    <div class="car">
      <div class="car-image">
        <img src="https://image.pollinations.ai/prompt/${carInfo.brand} ${carInfo.model}" />
      </div>
      <div class="car-info">
        <h4>${carInfo.brand} ${carInfo.model}</h4>
        <p><strong>Owner:</strong> ${carInfo.owner}</p>
        <p><strong>Plate:</strong> ${carInfo.plate}</p>
      </div>
    </div>
  `;

  parent.insertAdjacentHTML("beforeend", card);
};

const fetchAllCars = () => {
  const url = `https://garage.api.lewagon.com/${GARAGE}/cars`;

  fetch(url)
    .then((response) => {
      return response.json();
    })
    .then((body) => {
      body.forEach((carInfo) => {
        const parent = document.querySelector(".cars-list");
        insertCar(carInfo, parent);
      });
    });
};

fetchAllCars();
