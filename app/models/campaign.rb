class Campaign < ApplicationRecord
  belongs_to :user
  belongs_to :course

  has_many :campaign_media, class_name: 'CampaignMedia'
  has_many :campaign_transactions, class_name: 'Transaction'
  has_many :payments

  validates :description, :goal, presence: true

  def current_balance
    self.campaign_transactions.sum(:value).to_f
  end

  def create_transaction(value)
    self.campaign_transactions.create(value: value)
  end
end
