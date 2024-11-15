import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="form"
export default class extends Controller {
  static targets = ["myForm"]
  connect() {
  }

  async submitForm(event) {
    event.preventDefault()
    // this.myFormTarget.requestSubmit()
    // debugger
    const form_data = new FormData(this.myFormTarget)
    let form_inputs_value = new FormData
    form_data.forEach((v,k) => {
      form_inputs_value.append(k,v)
    })
    const json = JSON.stringify(form_inputs_value)
    fetch(this.myFormTarget.action, {
      method: "POST",
      headers:  {
        Accept: "text/vnd.turbo-stream.html",
        'X-CSRF-Token': this.getMetaContent('csrf-token'),
      },
      body: form_data
    })
    .then(response => {
      response.json()
    })
    .then(response => {
      document.querySelector("#error-messages").innerHTML = ''
      console.log("catch")
      const response_keys = Object.keys(response)
      for (let i = 0; i < response_keys.length; i++) {
        const message = response_keys[i];
        console.log(message)
        document.querySelector("#error-messages").innerHTML += `
          <li>${message}</li>
        `
      }
      debugger
    })
  }



  getMetaContent(name) {
    return document.querySelector(`meta[name="${name}"]`).getAttribute('content');
  }
}
