class UsersController < ApplicationController
  def create
    user = User.new(user_params)

    if user.save
      head(:ok)
    else
      head(:bad_request)
    end
  end

  def index
    users = User.all

    render json: users.to_json(
      only: [:id, :name, :slug]
    )
  end

  def show
    user = User.find_by_slug(params[:id])

    render json: user_data(user)
  end

  def auth
    email = params[:email]
    password = params[:password]

    user = User.find_by_email(email)

    if user.present? && user.password == password
      render json: user_data(user)
      return
    end

    head(:not_found)
  end

  private

  def user_params
    params.permit(:email, :password, :name, :cpf, :birth_date, :city, :state, :phone_number)
  end

  def user_data(data)
    data.to_json(
      except: [:password, :created_at, :updated_at],
      include: {
        campaigns: {
          include: {
            campaign_media: { only: [:url, :kind] },
            course: {
              include: {
                campus: { only: [:id, :name] },
                institution: { only: [:id, :kind, :name] },
              },
              only: [:id, :name, :price, :semesters]
            },
            payments: {
              methods: [:user_name],
              only: [:value],
            },
          },
          methods: [:current_balance],
        },
      },
    )
  end
end
