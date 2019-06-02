class CoursesController < ApplicationController
  def index
    courses = Course.all

    render json: course_data(courses)
  end

  def show
    course = Course.find(params[:id])

    render json: course_data(course)
  end

  private

  def course_data(data)
    data.to_json(
      only: [:id, :kind, :name, :level, :shift, :semesters, :price],
      include: {
        campus: { only: [:id, :name] },
        institution: { only: [:id, :kind, :name, :logo_url] },
      },
    )
  end
end
