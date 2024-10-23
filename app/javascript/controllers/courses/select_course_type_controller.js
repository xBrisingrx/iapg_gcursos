import { Controller } from "@hotwired/stimulus"
import TomSelect from "tom-select"

let room_select
let instructor_unit = 0
let instructors

// Connects to data-controller="courses--select-course-type"
export default class extends Controller {
  static targets = [ "selectCourseType", "startHour", "endHour" ]
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
    this.add_units_to_form()
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

  async add_units_to_form() {
    const units = document.getElementById('units')
    units.innerHTML  =  ''
    const course_type_id = this.selectCourseTypeTarget.value
    const url = `/course_types/${course_type_id}/course_type_units.json`
    // const url = `/course_types/${course_type_id}/course_type_units/add_units_to_form`
    const fetch_units = await fetch(url)
    const response = await fetch_units.json()
    units.insertAdjacentHTML('beforeend',
      `
        <div class="row">
          <div class="col-2">
            <h3>Módulo</h3>
          </div>
          <div class="col-1">
            <h3>Turno</h3>
          </div>
          <div class="col-1">
            <h3>Cupos</h3>
          </div>
          <div class="col-2">
            <h3>Horario</h3>
          </div>
          <div class="col-2">
            <h3>Instructor</h3>
          </div>
        </div>
      `
    )

    response.data.map( ( inputs ) => {
      units.insertAdjacentHTML('beforeend',
        `
          <div class="form-group row mb-3">
            <div class="col-2">
              <label for=""> Día ${inputs.day}: ${inputs.unit} </label>
              <input type="hidden" value=${inputs.unit_id} name="course[course_instructors_attributes][${instructor_unit}][unit_id]">
            </div>
            <div class="col-1">
              <label for=""> ${inputs.shift} </label>
            </div>
            <div class="col-1">
              <input type="number" disabled class="form-control" id="calc_quota" value=${inputs.calc_quota} />
            </div>
            <div class="col-2 row">
              <div class='col-6'>
                <input type="time" class="form-control" 
                  value="${inputs.start_hour}"
                  id="course_instructor_start_hour_${instructor_unit}"
                  name="course[course_instructors_attributes][${instructor_unit}][start_hour]"
                  data-controller="courses--select-course-type"
                  data-courses--select-course-type-target="startHour"
                  data-action="change->courses--select-course-type#calc_quota"
                  data-shift-time="${inputs.shift_time}"
                  data-index="${instructor_unit}" />
              </div>
              <div class='col-6'>
                <input type="time" class="form-control" 
                  value="${inputs.end_hour}"
                  id="course_instructor_end_hour_${instructor_unit}"
                  name="course[course_instructors_attributes][${instructor_unit}][end_hour]"
                  data-controller="courses--select-course-type"
                  data-action="change->courses--select-course-type#calc_quota"
                  data-shift-time="${inputs.shift_time}"
                  data-index="${instructor_unit}" />
              </div>
            </div>
            <div class="col-2">
              <select id="course_instructor_${instructor_unit}" name="course[course_instructors_attributes][${instructor_unit}][instructor_id]" class="form-control">
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

    // this.fetchAndUpdate(url)
  }

  select_option_instructors() {
    let options = ''
    instructors.map( instructor => options+=`<option value=${instructor.id}>${instructor.name}</option>` )
    return options
  }

  fetchAndUpdate(url) {
    fetch(url, {
      method: 'GET',
      headers: {
        Accept: 'text/vnd.turbo-stream.html, text/html, application/xhtml+xml',
        'X-Requested-With': 'XMLHttpRequest',
        'X-CSRF-Token': this.getMetaContent('csrf-token'),
        'Cache-Control': 'no-cache',
      },
    })
      .then(response => response.ok ? response.text() : Promise.reject('Response not OK'))
      .then(html => Turbo.renderStreamMessage(html))
      .catch(error => console.error('Error:', error));
  }

  getMetaContent(name) {
    return document.querySelector(`meta[name="${name}"]`).getAttribute('content');
  }

  calc_quota(event){
    setTimeout(() => {
      console.log(event.target.value)
      const row = event.target.parentElement.parentElement.parentElement
      const shift_time = event.target.dataset.shiftTime
      const row_index = event.target.dataset.index
      const start_hour = row.querySelector(`#course_instructor_start_hour_${row_index}`).value
      const end_hour = row.querySelector(`#course_instructor_end_hour_${row_index}`).value
      const quota = row.querySelector("#calc_quota")
      // Calcula los minutos de cada hora
      var minutos_inicio = start_hour.split(':')
      .reduce((p, c) => parseInt(p) * 60 + parseInt(c));
      var minutos_final = end_hour.split(':')
        .reduce((p, c) => parseInt(p) * 60 + parseInt(c));
      quota.value = Math.round((minutos_final - minutos_inicio) / shift_time)
    }, 1000) 
  }
}
