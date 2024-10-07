import { Controller } from "@hotwired/stimulus"
import TomSelect from "tom-select"

let room_select

// Connects to data-controller="courses--select-course-type"
export default class extends Controller {
  static targets = [ "selectCourseType" ]
  connect() {
    // meti el tomselect aca para poder tener el select en una variable y poder setear el valor 
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
    room_select.setValue(room_id)
    this.get_yearly_and_general_number()
  }

  get_yearly_and_general_number() {
    const course_type_id = this.selectCourseTypeTarget.value
    const url = `/course_types/${course_type_id}/get_yearly_and_general_number`
    fetch(url)
      .then(response => response.json())
      .then(data => {
        document.getElementById('course_year_number').value = data.yearly
        document.getElementById('course_general_number').value = data.general
      })
  }
}
