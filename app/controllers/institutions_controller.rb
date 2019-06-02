class InstitutionsController < ApplicationController
  def index
    render json: Institution.all
  end

  def show
    institution = Institution.find(params[:id])

    render json: institution
  end
end
