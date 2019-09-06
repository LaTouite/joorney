import "bootstrap";

import { loadDynamicBannerText } from '../components/banner';
import { initCountdown } from '../components/countdown';
import { chartDo } from '../components/chart';
// export { clic } from '..components/thematic';
//= require cocoon

if (document.querySelector("#banner-typed-text")) {
  loadDynamicBannerText();
}

if (document.querySelector(".countdown-col")) {
  initCountdown();
}


if (document.querySelector("#doughnut-chart")) {
  chartDo();
}

// require("chartkick")
// require("chart.js")
import flatpickrInit from '../plugins/flatpickr.js';
// import flatpickrInitDeadline from '../plugins/flatpickr.js';
import "flatpickr/dist/themes/material_blue.css";

flatpickrInit();
// flatpickrInitDeadline();

//Auto-complete address
import { initAutocomplete } from '../plugins/init_autocomplete.js';
if (document.querySelector('.address-autocomplete')) {
  initAutocomplete();
}

// Initialisation map
import 'mapbox-gl/dist/mapbox-gl.css';
import { initMapbox } from '../plugins/init_mapbox';
if (document.querySelector('#map')) {
  initMapbox();
}

// Favorite activities
import { initFavorite } from '../components/favorite';
if (document.querySelector('.favorite')) {
  initFavorite();
}

// Budget total activités en fonction des participants
import { initPrice} from '../components/form-event-activity';
if (document.querySelector("#event_activity_nb_of_participants")) {
  initPrice();
}


// Affichage PopUp envoi invitations
import { initSweetalert } from '../plugins/init_sweetalert';
if (document.querySelector('.submit-invitation')) {
initSweetalert('.submit-invitation', {
  title: "C'est parti !",
  text: 'Vos invitations ont bien été envoyées',
  icon: "success",
  // imageUrl: "assets/images/picto-joorney.png"
});
}

if (document.querySelector('.button-payment')) {
  initSweetalert('.button-payment', {
  title: "Paiement validé",
  text: "Il ne reste plus qu'à vous amuser !",
  icon: "success",
  timer: 2000
});
}


const initToggleDate = () => {
  const toggle_input_date = document.querySelector("#checkbox-toggle-survey-date");
  toggle_input_date.addEventListener("click", (event) => {
    const start_date = document.querySelector("#event_start_date_full");
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
// const thumbUp = () => {
//   const thumb = document.querySelectorAll('.thumb');

//   thumb.forEach((item) => {
//     item.addEventListener("click", (event) => {
//       event.currentTarget.classList.toggle("green-thumb");
//     });
//   });
// }

// if (document.querySelector('.thumb')) { thumbUp();}
// FIN POUCE

// ROTATIVE CARD (début)
const rotCard = () => {
  const clickbtn = document.querySelector('.click-rot');
  const rotCard= document.querySelector('.act-cards');

  clickbtn.addEventListener("click", (event) => {
    rotCard.classList.toggle("rotate3D-card");
  });
}

if (document.querySelector('.click-rot')) { rotCard();}
// ROTATIVE CARD (fin)

// CLIC SUR THEMATICS
const clic =() => {
  const thematic = document.querySelectorAll(".thematic-tag");
  thematic.forEach((item) => {
    item.addEventListener("click", (event) => {
      event.currentTarget.classList.toggle("green");
    });
  });
}

if (document.querySelector(".thematic-tag")) {
  clic();
}

// FIN CLIC SUR THEMATICS

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

// CLIC SUR AJOUTER UNE DATE (SURVEY NEW)
const simulateClickOn = (realclick, simulateclick) => {
  const realClk = document.querySelector(realclick);
  realClk.addEventListener("click", (event) => {
  const simulateClk = document.querySelector(simulateclick);
    simulateClk.click();
  });
}

if (document.querySelector(".cal-plus")) {
  simulateClickOn(".cal-plus", "#date-plus");
}

if (document.querySelector(".deadline-supp")) {
  simulateClickOn(".deadline-supp", "#button-delete");
}
