// app/javascript/application.js
import { Application } from "@hotwired/stimulus"
import { Turbo } from "@hotwired/turbo-rails"

// Load Trix and ActionText (for rich text)
import "trix"
import "@rails/actiontext"

import "./channels/mission_channel"
// Stimulus controller registration
import ModalController from "./controllers/modal_controller"
import AudioPlayerController from "./controllers/audio_player_controller"
import BoundsController from "./controllers/bounds_controller"
import DropdownController from "./controllers/dropdown_controller"

const application = Application.start()

application.register("modal", ModalController)
application.register("audio-player", AudioPlayerController)
application.register("bounds", BoundsController)
application.register("dropdown", DropdownController)

// FIXME: NOT SUPPOSED TO BE IN PROD JUST FOR DEBUGGING DO NOT COMMIT
window.application = application

//document.addEventListener('turbo:before-stream-render', (event) => {
//  console.log("Turbo Stream received:", event.detail);
//});
