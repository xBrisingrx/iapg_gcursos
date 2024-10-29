import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="courses--turn-form"
export default class extends Controller {
  static targets = ["form"]
  update_turn() {
    this.formTarget.requestSubmit()
  }
}
