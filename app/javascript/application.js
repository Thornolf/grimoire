// app/javascript/application.js

import { Application } from "@hotwired/stimulus"
import { Turbo } from "@hotwired/turbo-rails"

// Stimulus controller registration
import ModalController from "./controllers/modal_controller"

// Initialize Stimulus
const application = Application.start()
application.register("modal", ModalController)

// Load Trix and ActionText (for rich text)
import "trix"
import "@rails/actiontext"
