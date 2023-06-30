// import { Controller } from "@hotwired/stimulus"
// import flatpickr from "flatpickr";

// // Connects to data-controller="flatpickr"
// export default class extends Controller {

//   static targets = [ "startTime", "endTime" ]

//   connect() {
//     flatpickr(this.startTimeTarget, {})
//     flatpickr(this.endTimeTarget, {})
//   }
// }


import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";
// Import the rangePlugin from the flatpickr library
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";

// Connects to data-controller="flatpickr"
export default class extends Controller {
  static targets = [ "startTime", "endTime", "startingHour", "endingHour" ]
  connect() {
    // console.log('slt')
    flatpickr(this.startTimeTarget, {
              enableTime: true,
              // Provide an id for the plugin to work
              plugins: [new rangePlugin({ input: "#end_time"})]})
    flatpickr(this.endTimeTarget, {})


    flatpickr(this.startingHourTarget, {
      enableTime: true,
      noCalendar: true,
      dateFormat: "H:i",
      // Provide an id for the plugin to work
    })
    flatpickr(this.endingHourTarget, {
      enableTime: true,
      noCalendar: true,
      dateFormat: "H:i",
    })
  }
}
