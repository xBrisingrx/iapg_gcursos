import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="courses--select-course-type"
export default class extends Controller {
  static targets = [ "selectCourseType" ]

  select_default_room() {
    console.log(this.selectCourseTypeTarget.dataset.room)

  }
}
