class CourseUnitsController < ApplicationController
  def new
    @course = Course.find(params[:course_id])
    @course_unit = @course.course_units.new
  end

  def create
  end

  private
    def set_course_unit
      @course_unit = CourseUnit.find(params[:id])
    end

    def course_params
      params.require(:course).permit(:from_date, :year_number, :general_number, :is_company, :course_type_id)
    end
end
