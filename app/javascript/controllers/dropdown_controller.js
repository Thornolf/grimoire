// app/javascript/controllers/dropdown_controller.js

import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["menu"]

  connect() {
    // Initially hide the dropdown
    this.menuTarget.classList.add("hidden")
  }

  toggle() {
    // Toggle visibility of the dropdown menu
    this.menuTarget.classList.toggle("hidden")
  }

  hide(event) {
    // Check if the click happened outside the dropdown
    if (!this.element.contains(event.target)) {
      this.menuTarget.classList.add("hidden")
    }
  }
}
