// TODO: Validate this form

const addValidationClasses = (input, isValid) => {
  if (isValid) {
    // if the input is valid, add is-valid class
    input.classList.add("is-valid");
    input.classList.remove("is-invalid");
  } else {
    // if the input is invalid add is-invalid class
    input.classList.add("is-invalid");
    input.classList.remove("is-valid");
  }
};

const checkboxChecked = (input) => {
  // See if the checkbox input is checked and return boolean
  return input.checked;
};

const allFilled = (allInputs) => {
  // Check if all the fields have `is-valid` class
  return [...allInputs].every((input) => {
    return input.classList.contains("is-valid");
  });
};

const enableButton = (buttonElement) => {
  // Enable the button
  buttonElement.disabled = false;
  // Change the text of the button to submit
  buttonElement.innerText = "Submit";
};

const disableButton = (buttonElement) => {
  // disable the button
  buttonElement.disabled = true;
  // Change the text of the button to submit
  buttonElement.innerText = "Please fill out the form";
};

// When do we validate each field? on blur
// We get all input elements (except for the checkbox)
// Add event listner to all of them and see if there is anything typed
// If there is, add a valid class
const inputsToValidate = document.querySelectorAll(
  "input[type='text'], textarea, input[type='email']"
);

const tosCheckbox = document.querySelector("#tos");

const submitButton = document.querySelector("button[type='submit']");

inputsToValidate.forEach((input) => {
  input.addEventListener("blur", () => {
    // First, handle what to do with the currently blurred input
    const valid = input.value !== "";
    addValidationClasses(input, valid);

    // Check if all conditions are reunited to enable the submit button
    if (allFilled(inputsToValidate) && checkboxChecked(tosCheckbox)) {
      enableButton(submitButton);
    } else {
      disableButton(submitButton);
    }
  });
});

tosCheckbox.addEventListener("click", () => {
  if (allFilled(inputsToValidate) && checkboxChecked(tosCheckbox)) {
    enableButton(submitButton);
  } else {
    disableButton(submitButton);
  }
});
