class CourseUnitsController < ApplicationController
  def new
    @course = Course.find(params[:course_id])
    @course_unit = @course.course_units.new
  end

  def create
    course = Course.find(params[:course_id])
    course_unit = course.course_units.new(course_unit_params)
    day = course.course_type.course_type_units.find_by(unit_id: course_unit.unit_id, shift: course_unit.shift ).day
    course_unit.day = day

    respond_to do |format|
      if course_unit.save
        format.turbo_stream {
          render turbo_stream: [
            turbo_stream.replace("toasts",
              partial: "shared/toasts",
              locals: { message: "Módulo agregado", status_class: "primary" })
          ]
        }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @iva_condition.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_course_unit
      @course_unit = CourseUnit.find(params[:id])
    end

    def course_unit_params
      params.require(:course_unit).permit(:course_id, :unit_id, :instructor_id ,:shift, :start_hour, :end_hour)
    end
end
