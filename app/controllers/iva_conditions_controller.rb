class IvaConditionsController < ApplicationController
  before_action :set_iva_condition, only: %i[ show edit update destroy ]

  # GET /iva_conditions or /iva_conditions.json
  def index
    @iva_conditions = IvaCondition.all
  end

  # GET /iva_conditions/1 or /iva_conditions/1.json
  def show
  end

  # GET /iva_conditions/new
  def new
    @iva_condition = IvaCondition.new
  end

  # GET /iva_conditions/1/edit
  def edit
  end

  # POST /iva_conditions or /iva_conditions.json
  def create
    @iva_condition = IvaCondition.new(iva_condition_params)

    respond_to do |format|
      if @iva_condition.save
        format.html { redirect_to iva_condition_url(@iva_condition), notice: "Iva condition was successfully created." }
        format.json { render :show, status: :created, location: @iva_condition }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @iva_condition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /iva_conditions/1 or /iva_conditions/1.json
  def update
    respond_to do |format|
      if @iva_condition.update(iva_condition_params)
        format.html { redirect_to iva_condition_url(@iva_condition), notice: "Iva condition was successfully updated." }
        format.json { render :show, status: :ok, location: @iva_condition }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @iva_condition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /iva_conditions/1 or /iva_conditions/1.json
  def destroy
    @iva_condition.destroy!

    respond_to do |format|
      format.html { redirect_to iva_conditions_url, notice: "Iva condition was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_iva_condition
      @iva_condition = IvaCondition.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def iva_condition_params
      params.require(:iva_condition).permit(:name, :description, :active)
    end
end
