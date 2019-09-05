import flatpickr from "flatpickr";
import rangePlugin from 'flatpickr/dist/plugins/rangePlugin';

import "flatpickr/dist/themes/material_blue.css";

const flatpickrInit = () => {
  flatpickr(".datepicker", {
    // inline: true,
    mode: "range",
    "plugins": [new rangePlugin({ input: ".datepicker-end-date"})],
    dateFormat: "d-m-Y",
    minDate: "today"
  })
}

export default flatpickrInit;
