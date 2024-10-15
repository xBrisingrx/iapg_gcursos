import { Controller } from "@hotwired/stimulus"
import TomSelect from "tom-select"

// Connects to data-controller="courses--select-company"
export default class extends Controller {
  static targets = [ "company" ]

  display_managers(){
    const company_id = this.companyTarget.value
    fetch(`/companies/${company_id}/managers.json`)
      .then(response => response.json())
      .then(managers => {
        const select_managers = document.getElementById('course_person_manager_id')
        select_managers.classList.remove("form-control")
        select_managers.classList.remove("form-control-sm")
        select_managers.innerHtml = "<option value=''>Seleccione referente</option>"
        let options = ''
        managers.data.map( manager => options+=`<option value=${manager.person_id}>${manager.name}</option>`)
        select_managers.insertAdjacentHTML('beforeend',options)
        new TomSelect(select_managers, {          render: {
            no_results:function(data,escape){
              return '<div class="no-results">No hay resultados para "'+escape(data.input)+'"</div>';
            }
          }
        } )
      })
  }
}
