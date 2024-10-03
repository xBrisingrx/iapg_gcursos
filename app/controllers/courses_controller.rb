class CoursesController < ApplicationController
  before_action :set_course, only: %i[ show edit update modal_disable disable ]

  # GET /courses or /courses.json
  def index
    @query = Course.ransack(params[:query])
    @pagy, @courses = pagy(@query.result)
  end

  # GET /courses/1 or /courses/1.json
  def show
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
        format.turbo_stream {
          render turbo_stream: [
            turbo_stream.prepend("tbody_courses",
              partial: "courses/course",
              locals: { course: @course }),
            turbo_stream.replace("toasts",
              partial: "shared/toasts",
              locals: { message: "Curso registrado", status_class: "primary" })
          ]
        }
        format.html { redirect_to @course, notice: "Course was successfully created." }
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
        format.turbo_stream {
          render turbo_stream: [
            turbo_stream.replace(@course),
            turbo_stream.replace("toasts",
              partial: "shared/toasts",
              locals: { message: "Curso actualizado", status_class: "primary" })
          ]
        }
        format.html { redirect_to @course, notice: "Course was successfully updated." }
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def course_params
      params.require(:course).permit(:date, :year_number, :general_number, :is_company, :course_type_id, :room_id, :company_id, :active)
    end
end
