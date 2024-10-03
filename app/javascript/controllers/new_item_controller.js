// app/javascript/controllers/new_item_controller.js
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["plusSign", "form"];

  toggleForm() {
    this.plusSignTarget.classList.toggle("hidden");
    this.formTarget.classList.toggle("hidden");
  }
}
