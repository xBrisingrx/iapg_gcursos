import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="inscriptions--form"
export default class extends Controller {
  static targets = ["query", "personName", "selectCourseCategory"]
  connect() {
  }

  search_person(){
    setTimeout( () => {
      this.fetch_person()
    },
    2000
    )
  }

  fetch_person() {
    const person_to_serach = this.queryTarget.value
    fetch(`/people/search?query=${person_to_serach}`)
      .then(response => response.json())
      .then(data => {
        const {person} = data
        if (person === null) {
          this.personNameTarget.value = "No hay resultados con este cuil"
        } else {
          this.personNameTarget.value = person.name
        }
      })
  }

  get_courses() {
    const fleet = this.selectCourseCategoryTarget.value
    const category = this.selectCourseCategoryTarget.options[this.selectCourseCategoryTarget.selectedIndex].dataset.category
    fetch(`courses/search?fleet=${fleet}&category=${category}`, {
      headers: {
        Accept: "text/vnd.turbo-stream.html",
      },
    })
      .then(response => response.text() )
      .then(html => Turbo.renderStreamMessage(html))
      .catch(error => console.error('Error:', error))
  }

  select_course(event) {
    console.log(event.target)
  }
}
