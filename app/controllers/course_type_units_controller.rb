class CourseTypeUnitsController < ApplicationController
  before_action :set_course_type_unit, only: %i[ show edit update destroy ]

  # GET /course_type_units or /course_type_units.json
  def index
    @course_type_units = CourseTypeUnit.all
  end

  # GET /course_type_units/1 or /course_type_units/1.json
  def show
  end

  # GET /course_type_units/new
  def new
    @course_type_unit = CourseTypeUnit.new
  end

  # GET /course_type_units/1/edit
  def edit
  end

  # POST /course_type_units or /course_type_units.json
  def create
    @course_type_unit = CourseTypeUnit.new(course_type_unit_params)

    respond_to do |format|
      if @course_type_unit.save
        format.html { redirect_to @course_type_unit, notice: "Course type unit was successfully created." }
        format.json { render :show, status: :created, location: @course_type_unit }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @course_type_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /course_type_units/1 or /course_type_units/1.json
  def update
    respond_to do |format|
      if @course_type_unit.update(course_type_unit_params)
        format.html { redirect_to @course_type_unit, notice: "Course type unit was successfully updated." }
        format.json { render :show, status: :ok, location: @course_type_unit }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @course_type_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /course_type_units/1 or /course_type_units/1.json
  def destroy
    @course_type_unit.destroy!

    respond_to do |format|
      format.html { redirect_to course_type_units_path, status: :see_other, notice: "Course type unit was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course_type_unit
      @course_type_unit = CourseTypeUnit.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def course_type_unit_params
      params.require(:course_type_unit).permit(:course_type_id, :unit_id, :day, :start_hour, :end_hour, :start_brake, :end_brake, :is_by_turn)
    end
end
