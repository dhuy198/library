import { Application } from "@hotwired/stimulus"
import Rails from "@rails/ujs"
Rails.start()

const application = Application.start()

// Configure Stimulus development experience
application.debug = true
window.Stimulus = application

export { application }

