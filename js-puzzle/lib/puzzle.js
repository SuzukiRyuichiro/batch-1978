// Select all the tiles
const tiles = document.querySelectorAll("td");

const hasEmptyClass = (element) => {
  // For the edge of the puzzle
  if (element === undefined) {
    return false;
  }

  return element.classList.contains("empty");
};

const canMove = (tile) => {
  let above;
  let below;

  // <td> element
  // TODO: Check if a tile has an empty neighbour
  // get the index of the tile that was clicked within the row
  const indexOfTheTile = tile.cellIndex;

  // Get the row that the tile is in
  const row = tile.parentElement;
  const cellsInTheRow = row.cells;
  // get the tile on the right
  const right = cellsInTheRow[indexOfTheTile + 1];

  // get the tile on the left
  const left = cellsInTheRow[indexOfTheTile - 1];

  const rows = row.parentElement.rows;
  // get the tile on the top
  const rowAboveIndex = row.rowIndex - 1;
  // Get the row that is above
  const rowAbove = rows[rowAboveIndex];

  if (rowAbove !== undefined) {
    // Go into the cells in the row
    const cellsAbove = rowAbove.cells;
    // Use indexOfTheTile to pick the cell
    above = cellsAbove[indexOfTheTile];
  }

  // get the tile on the bottom
  const rowBelowIndex = row.rowIndex + 1;
  const rowBelow = rows[rowBelowIndex];

  if (rowBelow !== undefined) {
    // Go into the cells in the row
    const cellsBelow = rowBelow.cells;
    // Use indexOfTheTile to pick the cell
    below = cellsBelow[indexOfTheTile];
  }

  const cellsToCheck = [right, left, above, below];
  // check if any of them have the class of "empty"
  return cellsToCheck.some(hasEmptyClass);
};

const moveTile = (element) => {
  // <td> element that was clicked
  // TOOD: Move the tile
  // Get the number of the element that was clicked
  const numberToMove = element.innerText;
  // Get the empty cell
  const emptyCell = document.querySelector(".empty");
  // Fill the empty cell with the clicked number
  emptyCell.innerText = numberToMove;
  // Remove the empty class
  emptyCell.classList.remove("empty");
  // Remove the number from the clicked cell
  element.innerText = "";
  // Add empty class to the clicked cell
  element.classList.add("empty");
};

const checkIfPlayerWins = () => {
  // Get the table
  // Get the entire innerText of the table
  // See if it's in the winning order
  const winningOrder = "1\n2\n3\n4\n5\n6\n7\n8\n9\n10\n11\n12\n13\n14\n15";
  const tbody = document.querySelector("tbody");
  const win = tbody.innerText === winningOrder;

  if (win) {
    alert("Congrats!!");
  }
};

// Add event listener on each tile - Do not change the following
tiles.forEach((tile) => {
  tile.addEventListener("click", () => {
    console.log(canMove(tile));
    if (canMove(tile)) {
      moveTile(tile);
      checkIfPlayerWins();
    }
  });
});
