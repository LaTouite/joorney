import flatpickr from "flatpickr";
// require("flatpickr/dist/flatpickr.min.css");
// require("flatpickr/dist/themes/dark.css");
// require("flatpickr/dist/themes/airbnb.css)"
require("flatpickr/dist/themes/material_blue.css");
// require("flatpickr/dist/themes/confetti.css");
// require("flatpickr/dist/themes/light.css");

flatpickr(".datepicker", {
  inline: true,
  dateFormat: "Y-m-d",
  minDate: "today"
})
