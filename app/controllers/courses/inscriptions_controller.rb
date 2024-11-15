class Courses::InscriptionsController < ApplicationController
  def new
  end

  def create
    puts params
    render json: params, status: :unprocessable_entity
  end

  private
  
end
