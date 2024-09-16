import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["modal"]

  toggle() {
    this.modalTarget.classList.toggle("hidden");
  }

  hide() {
    this.modalTarget.classList.add("hidden");
  }

  stopPropagation(event) {
    event.stopPropagation();
  }
}
