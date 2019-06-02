class PaymentController < ApplicationController
  def pay
    if payment_params[:user_id].present?
      payment = Payment.new(
        user_id: payment_params[:user_id],
        campaign_id: payment_params[:campaign_id],
        value: payment_params[:value],
        method: payment_params[:method],
        kind: payment_params[:kind],
      )
    else
      user = User.where(email: payment_params[:user_email]).first_or_create
      user.password = payment_params[:user_password]

      payment = Payment.new(
        user_id: user.id,
        campaign_id: payment_params[:campaign_id],
        value: payment_params[:value],
        method: payment_params[:method],
        kind: payment_params[:kind],
      )
    end

    if payment.save
      payment.campaign.create_transaction(payment_params[:value])

      head(:ok)
    else
      head(:bad_request)
    end
  end

  private

  def payment_params
    params.require(:payment).permit(:user_id, :campaign_id, :value, :kind, :method, :user_email, :user_password)
  end
end
