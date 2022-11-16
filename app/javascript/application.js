// Entry point for the build script in your package.json
import { Application } from '@hotwired/stimulus'

// General Controllers
// -------------------
import controllers from './**/*_controller.js'

// Component Controllers
// ---------------------
import componentControllers from './../components/**/*_controller.js'

// Auxiliary Methods
// -----------------
function commonComponentName(defaultName) {
  const namespaces = [
    ...new Set(
      defaultName.split('--').filter((ns) => !['controllers'].includes(ns))
    )
  ]
  return namespaces.join('-')
}

function componentControllerName(defaultName) {
  const namespaces = [
    ...new Set(
      defaultName.split('--').filter((ns) => !['..', 'components'].includes(ns))
    )
  ]
  console.log(namespaces.join('-'))
  return namespaces.join('-')
}

const application = Application.start()

controllers.forEach((controller) => {
  application.register(
    commonComponentName(controller.name),
    controller.module.default
  )
})

componentControllers.forEach((controller) => {
  application.register(
    componentControllerName(controller.name),
    controller.module.default
  )
})

// Prints Stimulus information on console (controllers loaded, ...)
application.debug = true

window.Stimulus = application
