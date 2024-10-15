import { Controller } from "@hotwired/stimulus"
import TomSelect from "tom-select"

let room_select
let instructor_unit = 0
let instructors

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
    fetch('/instructors.json')
      .then(response => response.json())
      .then(data => {
        instructors = data
      })
  }
  
  select_default_room() {
    const room_id = this.selectCourseTypeTarget.selectedOptions[0].dataset.room
    room_select.setValue(room_id)
    this.get_yearly_and_general_number()
    this.set_units()
  }

  get_yearly_and_general_number() {
    const course_type_id = this.selectCourseTypeTarget.value
    const url = `/course_types/${course_type_id}/get_yearly_and_general_number`
    fetch(url)
      .then(response => response.json())
      .then(data => {
        document.getElementById('course_year_number').value = data.yearly + 1
        document.getElementById('course_general_number').value = data.general + 1
      })
  }

  async set_units() {
    const units = document.getElementById('units')
    units.innerHTML  =  ''
    const course_type_id = this.selectCourseTypeTarget.value
    const url = `/course_types/${course_type_id}/course_type_units.json`
    const fetch_units = await fetch(url)
    const response = await fetch_units.json()
    // `sale[payments_attributes][${i}][payments_currency_id]`
    // debugger
    units.insertAdjacentHTML('beforeend',
      `
        <div class="row">
          <div class="col-4">
            <h3>Módulo</h3>
          </div>
          <div class="col-4">
            <h3>Instructor</h3>
          </div>
        </div>
      `
    )
    response.data.map( ( inputs ) => {
      units.insertAdjacentHTML('beforeend',
        `
          <div class="form-group row mb-3">
            <div class="col-4">
              <label for=""> Día ${inputs.day}: ${inputs.unit} </label>
              <input type="hidden" value=${inputs.unit_id} name="course[course_instructors_attributes][${instructor_unit}][unit_id]">
            </div>
            <div class="col-4">
              <select id="course_instructor_${instructor_unit}" name="course[course_instructors_attributes][${instructor_unit}][instructor_id]" class="form-control tselect">
                <option value="">Seleccione instructor</option>
                ${this.select_option_instructors()}
              </select>
            </div>
          </div>
        `
      )
      new TomSelect( document.getElementById(`course_instructor_${instructor_unit}`), {
        render: {
          no_results:function(data,escape){
            return '<div class="no-results">No hay resultados para "'+escape(data.input)+'"</div>';
          }
        }
      } )
      instructor_unit++
    } )
  }

  select_option_instructors() {
    let options = ''
    instructors.map( instructor => options+=`<option value=${instructor.id}>${instructor.name}</option>` )
    return options
  }
}
