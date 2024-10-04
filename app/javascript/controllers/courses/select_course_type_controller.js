import { Controller } from "@hotwired/stimulus"
import TomSelect from "tom-select"

let room_select

// Connects to data-controller="courses--select-course-type"
export default class extends Controller {
  static targets = [ "selectCourseType" ]
  connect() {
    room_select = new TomSelect( document.getElementById('course_room_id'), {
      render: {
        no_results:function(data,escape){
          return '<div class="no-results">No hay resultados para "'+escape(data.input)+'"</div>';
        }
      }
    } )
  }
  select_default_room() {
    const room_id = this.selectCourseTypeTarget.selectedOptions[0].dataset.room
    document.getElementById('course_room_id-ts-control').value = room_id
    room_select.setValue(room_id)
  }
}
