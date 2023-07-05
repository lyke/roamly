import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="new-place"

export default class extends Controller {
    static targets = ["latitude", "longitude"];

    addPlace() {
        const latitude = this.latitudeTarget.value;
        const longitude = this.longitudeTarget.value;
    }
}
