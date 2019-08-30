import "bootstrap";
import { loadDynamicBannerText } from '../components/banner';
import { getTrueNumber } from '../components/countdown';

if (document.querySelector("#banner-typed-text")) {
  loadDynamicBannerText();
}

if (document.querySelector(".countdown-col")) {
  getTrueNumber();
}

// require("chartkick")
// require("chart.js")
import flatpickrInit from '../plugins/flatpickr.js';
import "flatpickr/dist/themes/material_blue.css";

flatpickrInit();

const initToggleDate = () => {
  const toggle_input_date = document.querySelector("#checkbox-toggle-survey-date");
  toggle_input_date.addEventListener("click", (event) => {
    event.preventDefault();
    const start_date = document.querySelector("#event_start_date_full");
    console.log(start_date);
    start_date.classList.toggle("d-none");
    start_date.removeAttribute('disabled');
    const end_date = document.querySelector("#event_end_date_full");
    end_date.classList.toggle("d-none");
    end_date.removeAttribute('disabled');
  });
}

if (document.querySelector("#checkbox-toggle-survey-date")) {
  initToggleDate();
}



const initTogglePlace = () => {
  const toggle_input_place = document.querySelector("#checkbox-toggle-survey-place");
  toggle_input_place.addEventListener("click", (event) => {
    event.preventDefault();
    const destination = document.querySelector("#event_destination");
    destination.classList.toggle("d-none");
    destination.removeAttribute('disabled');
  });
}

if (document.querySelector("#checkbox-toggle-survey-place")) {
  initTogglePlace();
}



const initToggleBudget = () => {
  const toggle_input_budget = document.querySelector("#checkbox-toggle-survey-budget");
  toggle_input_budget.addEventListener("click", (event) => {
    event.preventDefault();
    const budget = document.querySelector("#event_budget_per_participant_cents");
    budget.classList.toggle("d-none");
    budget.removeAttribute('disabled');
  });
}

if (document.querySelector("#checkbox-toggle-survey-budget")) {
  initToggleBudget();
}

// import "../plugins/flatpickr";

// Faire apparaître le résultat de l'input range
// lorsque le curseur se déplace
const range = () => {
  const slider = document.querySelector(".range");
  const output = document.querySelector("#range-value");
  output.innerHTML = slider.value; // Display the default slider value

  // Update the current slider value (each time you drag the slider handle)
  slider.oninput = function() {
    output.innerHTML = this.value;
  }
}
if (document.querySelector('.range')) { range();}

// POUCE change de couleur au clic
const thumbUp = () => {
  const thumb = document.querySelector('.far');

  thumb.addEventListener("click", (event) => {
    if (event.currentTarget.classList.contains('far')) {
      event.currentTarget.classList.remove("far");
      event.currentTarget.classList.add("fas");
    } else {
      event.currentTarget.classList.remove("fas");
      event.currentTarget.classList.add("far");
    }
  });
}

if (document.querySelector('.far')) { thumbUp();}
// FIN POUCE

// clic sur le "+" de survey (destination)
const plus = () => {
  const destPlus = document.querySelector('#dest-plus');
  const destDiv = document.querySelector('#destination-sugg');
  destPlus.addEventListener("click", (event) => {
    const j = "choix 2"
    destDiv.insertAdjacentHTML('beforeend', j );
  });
}

if (document.querySelector('#dest-plus')) { plus();}

// const plus = () => {
//   const plus = document.querySelectorAll('.plus');
//   plus.forEach.addEventListener("click", (event) => {
//     plus.insertAdjacentHTML('beforebegin', '</br><span>choix 2</span>');
//   });
// }

// if (document.querySelector('.far')) { plus();}




const initDisplayNumber = () => {
  const whatsapp_icon = document.querySelector(".whatsapp");
  whatsapp_icon.addEventListener("click", (event) => {
    event.preventDefault();
    const phone_number_input = document.querySelector(".number-form");
    phone_number_input.classList.add("open");
  });
}

if (document.querySelector(".whatsapp")) {
  initDisplayNumber();
}
