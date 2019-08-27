import "bootstrap";
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
