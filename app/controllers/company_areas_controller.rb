class CompanyAreasController < ApplicationController
  before_action :set_company_area, only: %i[ show edit update modal_disable disable ]

  # GET /company_areas or /company_areas.json
  def index
    filter = CompanyArea.filter(params[:query])
    @pagy, @company_areas = pagy(filter)
  end

  # GET /company_areas/1 or /company_areas/1.json
  def show
  end

  # GET /company_areas/new
  def new
    @company_area = CompanyArea.new
  end

  # GET /company_areas/1/edit
  def edit
  end

  # POST /company_areas or /company_areas.json
  def create
    @company_area = CompanyArea.new(company_area_params)
    respond_to do |format|
      if @company_area.save
        format.turbo_stream { 
          render turbo_stream: [
            turbo_stream.prepend("tbody_company_areas", 
              partial: "company_areas/company_area", 
              locals: { company_area: @company_area }),
            turbo_stream.replace("toasts", 
              partial: "shared/toasts", 
              locals: { message: 'Rubro registrado', status_class: 'primary' })
          ]
        }
        format.html { redirect_to company_area_url(@company_area), notice: "Rubro registrado." }
        format.json { render :show, status: :created, location: @company_area }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @company_area.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /company_areas/1 or /company_areas/1.json
  def update
    respond_to do |format|
      if @company_area.update(company_area_params)
        format.turbo_stream { 
          render turbo_stream: [
            turbo_stream.replace(@company_area),
            turbo_stream.replace("toasts", 
              partial: "shared/toasts", 
              locals: { message: 'Rubro actualizado', status_class: 'primary' })
          ]
        }
        format.html { redirect_to @company_area, notice: "Rubro actualizada." }
        format.json { render :show, status: :ok, location: @company_area }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @company_area.errors, status: :unprocessable_entity }
      end
    end
  end

  def modal_disable;end

  def disable
    if @company_area.update(active: false)
        render turbo_stream: [
          turbo_stream.remove(@company_area),
          turbo_stream.replace("toasts", 
            partial: "shared/toasts", 
            locals: { message: 'Rubro eliminado', status_class: 'primary' })
        ], status: :ok
    else
      render json: @company_area.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company_area
      @company_area = CompanyArea.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def company_area_params
      params.require(:company_area).permit(:name, :description, :active)
    end
end
