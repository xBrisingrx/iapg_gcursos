import { Controller } from "@hotwired/stimulus"
import { Toast } from "bootstrap"
// Connects to data-controller="courses--form"
export default class extends Controller {
  static targets = ["form"]
  connect() {
  }

  submit_form(event){
    event.preventDefault()
    const form_data = new FormData(this.formTarget)
    fetch(this.formTarget.action, {
      method: "POST",
      headers:  {
        'X-CSRF-Token': document.querySelector("meta[name='csrf-token']").getAttribute('content'),
      },
      body: form_data
    })
    .then(response => response.json())
    .then(response => {
      document.querySelectorAll('.text-danger').forEach( element => element.innerHTML = '' )
      const response_keys = Object.keys(response)
      for (let i = 0; i < response_keys.length; i++) {
        const message = response[response_keys[i]][0] 
        let input_class = 'course'
        response_keys[i].split('.').forEach(element => {
          input_class += `_${element}`
        })
        document.querySelector(`.${input_class}`).innerHTML = message
      }
      debugger
    })
  }
}