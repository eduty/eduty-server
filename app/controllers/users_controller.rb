class UsersController < ApplicationController
  def create
    user = User.find_by_email(params[:email])

    if user.present?
      user.city = params[:city]
      user.name = params[:name]
      user.phone_number = params[:phone]
    else
      user = User.new(
        email: params[:email],
        city: params[:city],
        state: params[:state],
        name: params[:name],
        phone_number: params[:phone],
        password: params[:password],
      )
    end

    if user.save
      render json: user_data(user)
      return
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
    user = User.find_by_slug(params[:slug])

    if user.blank?
      head(:not_found)
      return
    end

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
              only: [:created_at, :value],
            },
          },
          methods: [:current_balance],
        },
      },
    )
  end
end
