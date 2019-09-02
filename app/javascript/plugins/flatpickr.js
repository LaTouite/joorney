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

// const flatpickrInitDeadline = () => {
//   flatpickr(".datepicker-deadline", {
//     inline: true,
//     // mode: "range",
//     dateFormat: "Y-m-d",
//     minDate: "today"
//   })
// }

export default flatpickrInit;
// export default flatpickrInitDeadline;
