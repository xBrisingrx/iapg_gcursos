class Courses::Inscriptions::LightController < ApplicationController
  # la idea es manejar el crud de un curso de livianos
  #
  def index
    render json: { data: "Llegamos" }
  end

  def new
  end

  def create
  end
end
