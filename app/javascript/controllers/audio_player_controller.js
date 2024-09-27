import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    src: String
  }

  connect() {
    console.log("AudioPlayerController connected")
  }

  playAudio() {
    console.log("playAudio() called with srcValue:", this.srcValue)
    const audio = new Audio("/rails/active_storage/blobs/redirect/eyJfcmFpbHMiOnsiZGF0YSI6MSwicHVyIjoiYmxvYl9pZCJ9fQ==--5244a4d5f52543261382ea652d2562b8576a312d/mMurlocAggroOld.ogg")
    audio.play().catch(error => {
      console.error("Failed to play audio:", error)
    })
  }
}
