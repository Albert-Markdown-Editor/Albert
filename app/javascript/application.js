// Entry point for the build script in your package.json
import '@hotwired/turbo-rails'
import { Application } from '@hotwired/stimulus'

// General Controllers
// -------------------
import controllers from './**/*_controller.js'

// Component Controllers
// ---------------------
import componentControllers from './../components/**/*_controller.js'

// Auxiliary Methods
// -----------------
function controllerName(defaultName) {
  const namespaces = [
    ...new Set(
      defaultName
        .split('--')
        .filter((ns) => !['..', 'controllers'].includes(ns))
    )
  ]
  return namespaces.join('--')
}

function componentControllerName(defaultName) {
  const namespaces = [
    ...new Set(
      defaultName.split('--').filter((ns) => !['..', 'components'].includes(ns))
    )
  ]
  return namespaces.join('--')
}

const application = Application.start()

// Configure Stimulus development experience
application.debug = true
window.Stimulus = application

controllers.forEach((controller) => {
  Stimulus.register(controllerName(controller.name), controller.module.default)
})

componentControllers.forEach((controller) => {
  Stimulus.register(
    componentControllerName(controller.name),
    controller.module.default
  )
})
