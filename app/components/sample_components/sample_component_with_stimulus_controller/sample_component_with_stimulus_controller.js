import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  connect() {
    alert('Sample Component Stimulus Controller loaded!')
  }
}