import { Controller } from '@hotwired/stimulus'
import tippy from 'tippy.js'

export default class extends Controller {
  static values = {
    tippyOptions: Object
  }

  static targets = ['trigger', 'body']

  connect() {
    this._initializeTippy()
  }

  /**
   * Initializes Tippy.js module
   * @private
   */
  _initializeTippy() {
    const content = this.bodyTarget.innerHTML
    const options = this.tippyOptionsValue

    // Do not initialize tippy if popover does not have content
    if (content === '') return

    tippy(this.triggerTarget, {
      content: content,
      allowHTML: true,
      ...options
    })
  }
}
