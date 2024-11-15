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
    // let form_inputs_value = new FormData
    // form_data.forEach((v,k) => {
    //   form_inputs_value.append(k,v)
    // })
    // const json = JSON.stringify(form_inputs_value)
    fetch(this.formTarget.action, {
      method: "POST",
      headers:  {
        'X-CSRF-Token': document.querySelector("meta[name='csrf-token']").getAttribute('content'),
      },
      body: form_data
    })
    .then(response => response.json())
    .then(response => {
      document.querySelector("#error-messages").innerHTML = ''
      const response_keys = Object.keys(response)
      for (let i = 0; i < response_keys.length; i++) {
        const message = response[response_keys[i]][0] 

        document.querySelector("#error-messages").innerHTML += `
          <li>${message}</li>
        `
      }
      debugger
    })
  }
}