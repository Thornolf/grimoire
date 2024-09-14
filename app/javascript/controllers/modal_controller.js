import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["modal"]

  toggle() {
    console.log("toggle")
    this.modalTarget.classList.toggle("hidden");
  }

  hide() {
    console.log("hide")
    this.modalTarget.classList.add("hidden");
  }
}
