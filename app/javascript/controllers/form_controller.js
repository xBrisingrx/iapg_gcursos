import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="form"
export default class extends Controller {
  static targets = ["myForm"]
  connect() {
  }

  submitForm(event) {
    event.preventDefault()
    this.myFormTarget.requestSubmit()
    debugger
    // const data = new FormData(this.myFormTarget)

    // fetch(this.myFormTarget.action, {
    //   method: "POST",
    //   headers:  {
    //     "Content-Type": "application/json",
    //     "Accept": "application/json",
    //     'X-CSRF-Token': this.getMetaContent('csrf-token'),
    //   },
    //   body: JSON.stringify(data)
    // })
    // .then(response => response.json())
    // .then(response => {
    //   console.log(response)
    //   debugger
    // })
  }

  getMetaContent(name) {
    return document.querySelector(`meta[name="${name}"]`).getAttribute('content');
  }
}
