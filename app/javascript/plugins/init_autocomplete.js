import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.querySelectorAll('.address-autocomplete');

  if (addressInput.length > 0) {
    addressInput.forEach((input) => {
      places({ container: input });
    })
  }
};

export { initAutocomplete };
