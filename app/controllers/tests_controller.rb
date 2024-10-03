class TestsController < ApplicationController
  before_action :set_test, only: %i[ show edit update modal_disable disable ]

  # GET /tests or /tests.json
  def index
    @query = Test.actives.ransack(params[:query])
    @pagy, @tests = pagy(@query.result)
  end

  # GET /tests/1 or /tests/1.json
  def show
  end

  # GET /tests/new
  def new
    @test = Test.new
  end

  # GET /tests/1/edit
  def edit
  end

  # POST /tests or /tests.json
  def create
    @test = Test.new(test_params)

    respond_to do |format|
      if @test.save
        format.html { redirect_to tests_path, notice: "Exámen registrado." }
        format.json { render :show, status: :created, location: @test }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tests/1 or /tests/1.json
  def update
    respond_to do |format|
      if @test.update(test_params)
        format.html { redirect_to @test, notice: "Exámen actualizado." }
        format.json { render :show, status: :ok, location: @test }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  def modal_disable;end

  def disable
    if @test.disable
        render turbo_stream: [
          turbo_stream.remove(@test),
          turbo_stream.replace("toasts",
            partial: "shared/toasts",
            locals: { message: "Exámen eliminado", status_class: "primary" })
        ], status: :ok
    else
      render json: @test.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test
      @test = Test.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def test_params
      params.require(:test).permit(:name, :instance, :fleet, :modality, :active)
    end
end
