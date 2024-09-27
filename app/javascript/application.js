// app/javascript/application.js

import { Application } from "@hotwired/stimulus"
import { Turbo } from "@hotwired/turbo-rails"

// Load Trix and ActionText (for rich text)
import "trix"
import "@rails/actiontext"

// Stimulus controller registration
import ModalController from "./controllers/modal_controller"
import AudioPlayerController from "./controllers/audio_player_controller"

// Initialize Stimulus
const application = Application.start()
application.register("modal", ModalController)
application.register("audio-player", AudioPlayerController)

// FIXME: NOT SUPPOSED TO BE IN PROD JUST FOR DEBUGGING DO NOT COMMIT
window.application = application

// Check if Stimulus is loaded
console.log("LOADED Stimulus")
console.log(application.controllers) // Log Stimulus controllers
