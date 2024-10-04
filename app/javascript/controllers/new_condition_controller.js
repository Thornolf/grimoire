import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["dropdown"]

  connect() {
    // Initially hide the dropdown
    this.hideDropdown()
  }

  toggleDropdown() {
    if (this.dropdownTarget.classList.contains("hidden")) {
      this.showDropdown()
    } else {
      this.hideDropdown()
    }
  }

  showDropdown() {
    this.dropdownTarget.classList.remove("hidden")
  }

  hideDropdown() {
    this.dropdownTarget.classList.add("hidden")
  }
}
