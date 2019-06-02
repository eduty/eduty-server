class CoursesController < ApplicationController
  def index
    courses = Course.where(campus_id: params[:campus_id])

    render json: courses
  end

  def show
    course = Course.find(params[:id])

    render json: course
  end
end
