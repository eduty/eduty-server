class UserController < ApplicationController
  def auth
    email = params[:email]
    password = params[:password]

    @user = User.find_by_email(email)

    if @user.present? && @user.password == password
      render json: user_data
      return
    end

    head(:not_found)
  end

  private

  def user_data
    @user.to_json(except: [:password, :created_at, :updated_at])
  end
end
