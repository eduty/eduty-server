class Campaign < ApplicationRecord
  belongs_to :user
  belongs_to :course

  has_many :campaign_media, class_name: 'CampaignMedia'
  has_many :campaign_transactions, class_name: 'Transaction'
  has_many :payments

  before_save :calculate_goal

  def current_balance
    self.campaign_transactions.sum(:value).to_f
  end

  def create_transaction(value)
    self.campaign_transactions.create(value: value)
  end

  private

  def calculate_goal
    self.course.price * self.course.semesters * 6
  end
end
