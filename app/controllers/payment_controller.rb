class PaymentController < ApplicationController
  def pay
    payment = Payment.new(payment_params)

    if payment.save
      payment.campaign.create_transaction(payment_params[:value])

      head(:ok)
    else
      head(:bad_request)
    end
  end

  private

  def payment_params
    params.require(:payment).permit(:user_id, :campaign_id, :value, :kind, :method)
  end
end
