class CoursesController < ApplicationController
  before_action :set_course, only: %i[ show edit update modal_disable disable turns_by_unit ]

  # GET /courses or /courses.json
  def index
    @query = Course.ransack(params[:query])
    @pagy, @courses = pagy(@query.result)
  end

  # GET /courses/1 or /courses/1.json
  def show
    @course_people = CoursePerson.where(course_id: params[:course_id])
    @units = @course.course_type.units
  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses or /courses.json
  def create
    @course = Course.new(course_params)

    respond_to do |format|
      if @course.save
        format.html { redirect_to courses_path, notice: "Curso registrado." }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1 or /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to courses_path, notice: "Courso actualizado." }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @course.errors, status: :unprocessable_entity }
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

  def turns_by_unit
    @query = @course.course_people.where(unit_id: params[:unit_id]).order(:from_hour)
    @pagy, @course_people = pagy(@query)
  end

  def calendar_format
    @courses = Course.actives
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def course_params
      params.require(:course).permit(:from_date, :year_number, :general_number, :is_company, :course_type_id,
        :room_id, :company_id, :active,
        course_instructors_attributes: [ :id, :instructor_id, :unit_id ])
    end
end
