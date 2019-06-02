class CampusesController < ApplicationController
  def index
    campuses = Campus.where(institution_id: params[:institution_id])

    render json: campuses
  end

  def show
    campus = Campus.find(params[:id])

    render json: campus
  end
end
