class CampaignsController < ApplicationController
  def create
    campaign_params = {
      course_id: params[:course_id],
      description: params[:description],
      user_id: params[:user_id],
    }

    campaign = Campaign.new(campaign_params)

    if campaign.save
      if params[:campaign_media].present?
        campaign.campaign_media.create(url: params[:campaign_media], kind: 'video')
      end

      head(:ok)
    else
      head(:bad_request)
    end
  end

  def index
    campaigns = Campaign.all

    render json: campaign_data(campaigns)
  end

  def show
    campaign = Campaign.find(params[:id])

    render json: campaign_data(campaign)
  end

  private

  def campaign_data(data)
    data.to_json(
      expect: [:updated_at],
      include: {
        campaign_media: { only: [:url, :kind] },
        payments: {
          methods: [:user_name],
          only: [:value],
        },
        user: {
          only: [:id, :email, :name, :slug],
        },
      },
      methods: [:money_paid, :money_left, :percent_with_enough_money, :installments_paid, :installments_left],
    )
  end
end
