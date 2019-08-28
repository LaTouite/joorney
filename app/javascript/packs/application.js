import "bootstrap";

// Ne fonctionne pas pour la date : à mon avis parce que id de date divisé en plusieurs dans simple form avec année, mois,...

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
var slider = document.querySelector(".range");
var output = document.querySelector("#range-value");
output.innerHTML = slider.value; // Display the default slider value

// Update the current slider value (each time you drag the slider handle)
slider.oninput = function() {
  output.innerHTML = this.value;
}

// POUCE change de couleur au clic
const thumbUp = () => {
  const thumb = document.querySelector('.far');

  thumb.addEventListener("click", (event) => {
      (event.currentTarget.classList.toggle("fas")) && (event.currentTarget.classList.toggle("far"));
  });
}

if (document.querySelector('.far')) { thumbUp();}
// FIN POUCE

// clic sur le "+" de survey (dates)
// A FAIRE
