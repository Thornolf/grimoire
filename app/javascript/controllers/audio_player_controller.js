import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    src: String
  }

  connect() {
    console.log("AudioPlayerController connected")
    this.playAudio()
  }

  playAudio() {
    console.log("playAudio() called with srcValue:", this.srcValue)
    const audio = new Audio(this.srcValue)
    audio.play().catch(error => {
      console.error("Failed to play audio:", error)
    })
  }
}
