import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    src: String
  }

  connect() {
    this.playAudio()
  }

  playAudio() {
    const audio = new Audio(this.srcValue)
    audio.play().catch(error => {
      console.error("Failed to play audio:", error)
    })
  }
}
