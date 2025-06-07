const fullName = "John Doe";

console.log(`Hello my name is ${fullName}`);

console.log(parseInt("101"));

const students = ["Hannah", "Taka", "Andriani"];

console.log(students[1]);

const antonio = {
  firstName: "Antonio",
  lastName: "Vinciguerra",
  age: 23,
  hobbies: ["Cooking", "Hiking", "Karaoke"],
  married: true,
  home: {
    prefecture: "Tokyo",
    ward: "Meguro",
    street: "Donuts Street",
  },
};

// console.log(antonio.home.ward);

console.log(
  `${antonio.firstName} is ${antonio.age} and he lives in ${antonio.home.ward}`
);

// This is not allowed
// antonio = { firstName: 'Bruno' }

// This is allowed
antonio.middleName = "Bruno";
antonio.age += 1;

console.log(antonio);

// IF statement

const age = 19;

if (age >= 18) {
  console.log("You can vote!");
} else if (age < 0) {
  console.log("You are not even born!!");
} else {
  console.log("You cannot vote!");
}

const sum = (numberOne, numberTwo) => {
  // Write the logic of the function
  return numberOne + numberTwo;
};

const result = sum(1, 2);
console.log(result);

// Define a function called capitalize
// Input: 'hello'
// Output: 'Hello'

const capitalize = (word) => {
  // Get the first letter of the word
  const firstLetter = word[0];
  // Upcase the letter
  const upcasedFirstLetter = firstLetter.toUpperCase();
  // Get the rest of the word
  const rest = word.substring(1);
  // Lower case the rest
  const lowercasedRest = rest.toLowerCase();
  // Combine them together
  return `${upcasedFirstLetter}${lowercasedRest}`;
};

const capitalizedHello = capitalize("hello");

console.log(capitalizedHello);
