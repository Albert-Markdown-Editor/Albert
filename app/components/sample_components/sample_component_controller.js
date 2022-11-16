import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  connect() {
    console.log('me llama')
    alert('Sample Component Stimulus Controller loaded!')
  }
}
