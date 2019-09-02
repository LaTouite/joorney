import flatpickr from "flatpickr";
import "flatpickr/dist/themes/material_blue.css";

const flatpickrInit = () => {
  flatpickr(".datepicker", {
    // inline: true,
    // mode: "range",
    dateFormat: "d-m-Y",
    minDate: "today"
  })
}

export default flatpickrInit;
