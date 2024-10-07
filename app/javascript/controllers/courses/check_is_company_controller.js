import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="courses--check-is-company"
export default class extends Controller {
  static targets = [ "isCompany", "selectCompanies" ]

  check_is_company() {
    const select_companies = document.getElementById('course_company_id-ts-control')
    select_companies.disabled = !this.isCompanyTarget.checked
    select_companies.required = this.isCompanyTarget.checked
  }
}
