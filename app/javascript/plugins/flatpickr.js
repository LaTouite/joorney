import flatpickr from "flatpickr";
import "flatpickr/dist/themes/material_blue.css";

const flatpickrInit = () => {
  flatpickr(".datepicker", {
    // inline: true,
    dateFormat: "Y-m-d",
    minDate: "today"
  })
}

export default flatpickrInit;
