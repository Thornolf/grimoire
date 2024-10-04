import { Controller } from "@hotwired/stimulus";
import debounce from "lodash/debounce"; // Import just debounce

export default class extends Controller {
  connect() {
    this.element.addEventListener("input", debounce(() => this.save(), 15000));
  }

  save() {
    this.element.closest("form").requestSubmit();
  }

  reset() {
    this.element.reset();
  }
}
