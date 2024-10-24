class CoursePeopleController < ApplicationController
  before_action :set_course_person, only: %i[ show edit update modal_disable disable ]

  # GET /courses or /courses.json
  def index
    @query = CoursePerson.where(course_id: params[:course_id]).includes(:person).group(:person_id).order(people: { last_name: :asc })
    @pagy, @course_people = pagy(@query)
  end

  # GET /courses/1 or /courses/1.json
  def show
  end

  # GET /courses/new
  def new
    course_person_variables
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses or /courses.json
  def create
    @course = Course.find(params[:course_id])
    @course_person = @course.course_people.new(course_person_params)
    course_type_unit = CourseTypeUnit.where(course_type_id: @course.course_type_id).order(:day).first
    @course_person.unit_id = course_type_unit.unit_id
    @course_person.course_type_unit = course_type_unit
    @course_person.date = @course.from_date
    respond_to do |format|
      if @course_person.save
        @course_person.assign_turn
        format.turbo_stream {
          render turbo_stream: [
              turbo_stream.replace("toasts",
                partial: "shared/toasts",
                locals: { message: "Persona agregada al curso.", status_class: "primary" })
          ]
        }
        format.html { redirect_to courses_path, notice: "Curso registrado." }
        format.json { render :show, status: :created, location: @course_person }
      else
        course_person_variables
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @course_person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1 or /courses/1.json
  def update
    respond_to do |format|
      if @course_person.update(course_person_params)
        format.html { redirect_to courses_path, notice: "Courso actualizado." }
        format.json { render :show, status: :ok, location: @course_person }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @course_person.errors, status: :unprocessable_entity }
      end
    end
  end

  def modal_disable;end

  def disable
    if @course.disable
        render turbo_stream: [
          turbo_stream.remove(@course),
          turbo_stream.replace("toasts",
            partial: "shared/toasts",
            locals: { message: "Curso dado de baja.", status_class: "primary" })
        ], status: :ok
    else
      render turbo_stream: [
        turbo_stream.replace("toasts",
          partial: "shared/toasts",
          locals: { message: "No se pudo dar de baja el curso.", status_class: "danger" }) ],
        status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course_person
      @course_person = CoursePerson.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def course_person_params
      params.require(:course_person).permit(
        :course_id,
        :person_id,
        :manager_id,
        :company_id,
        :operator_id,
        :inscription_motive_id,
        :fleet_category_id
      )
    end

    def course_person_variables
      @course = Course.find(params[:course_id])
      @course_person = CoursePerson.new
      poeple_ids = @course.people.pluck(:id)
      @people = Person.actives.where.not(id: poeple_ids)
    end
end
