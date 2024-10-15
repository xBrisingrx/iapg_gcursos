class ManagersController < ApplicationController
  before_action :set_manager, only: %i[ show edit modal_disable disable ]

  # GET /managers or /managers.json
  def index
    @managers = CompanyManager.where(company_id: params[:company_id]).includes(:person)
  end

  # GET /managers/1 or /managers/1.json
  def show
  end

  # GET /managers/new
  def new
    @manager = CompanyManager.new
  end

  # GET /managers/1/edit
  def edit
  end

  # POST /managers or /managers.json
  def create
    @manager = CompanyManager.new(course_params)

    respond_to do |format|
      if @manager.save
        format.html { redirect_to courses_path, notice: "Referente registrado." }
        format.json { render :show, status: :created, location: @manager }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @manager.errors, status: :unprocessable_entity }
      end
    end
  end

  def modal_disable;end

  def disable
    if @manager.disable
        render turbo_stream: [
          turbo_stream.remove(@manager),
          turbo_stream.replace("toasts",
            partial: "shared/toasts",
            locals: { message: "Referente dado de baja.", status_class: "primary" })
        ], status: :ok
    else
      render turbo_stream: [
        turbo_stream.replace("toasts",
          partial: "shared/toasts",
          locals: { message: "No se pudo dar de baja el referente.", status_class: "danger" }) ],
        status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_manager
      @manager = CompanyManager.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def course_params
      params.require(:course).permit(:date, :year_number, :general_number, :is_company, :course_type_id,
        :room_id, :company_id, :active,
        course_instructors_attributes: [ :id, :instructor_id, :unit_id ])
    end
end
