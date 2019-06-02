class Campaign < ApplicationRecord
  belongs_to :user
  belongs_to :course

  has_many :campaign_media, class_name: 'CampaignMedia'
  has_many :campaign_transactions, class_name: 'Transaction'
  has_many :payments

  before_save :calculate_goal

  def installments_paid
    1.to_i
  end

  def percent_with_enough_money
    ((self.money_paid / self.calculate_goal) * 100).to_f
  end

  def installments_left
    (self.count_months - self.installments_paid).ceil
  end

  def money_left
    (self.calculate_goal - self.money_paid).to_f
  end

  def money_paid
    self.campaign_transactions.sum(:value).to_f
  end

  def create_transaction(value)
    self.campaign_transactions.create(value: value)
  end

  def calculate_goal
    self.course.price * self.count_months
  end

  def count_months
    self.course.semesters * 6
  end
end
