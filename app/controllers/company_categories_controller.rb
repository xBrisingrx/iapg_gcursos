class CompanyCategoriesController < ApplicationController
  before_action :set_company_category, only: %i[ show edit update destroy ]

  # GET /company_categories or /company_categories.json
  def index
    @company_categories = CompanyCategory.all
  end

  # GET /company_categories/1 or /company_categories/1.json
  def show
  end

  # GET /company_categories/new
  def new
    @company_category = CompanyCategory.new
  end

  # GET /company_categories/1/edit
  def edit
  end

  # POST /company_categories or /company_categories.json
  def create
    @company_category = CompanyCategory.new(company_category_params)

    respond_to do |format|
      if @company_category.save
        format.html { redirect_to @company_category, notice: "Company category was successfully created." }
        format.json { render :show, status: :created, location: @company_category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @company_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /company_categories/1 or /company_categories/1.json
  def update
    respond_to do |format|
      if @company_category.update(company_category_params)
        format.html { redirect_to @company_category, notice: "Company category was successfully updated." }
        format.json { render :show, status: :ok, location: @company_category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @company_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /company_categories/1 or /company_categories/1.json
  def destroy
    @company_category.destroy!

    respond_to do |format|
      format.html { redirect_to company_categories_path, status: :see_other, notice: "Company category was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company_category
      @company_category = CompanyCategory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def company_category_params
      params.require(:company_category).permit(:name, :description, :quota, :active)
    end
end
