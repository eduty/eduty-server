class Payment < ApplicationRecord
  belongs_to :campaign
  belongs_to :user

  validates :method, :kind, :value, presence: true

  def user_name
    self.user.name
  end
end
