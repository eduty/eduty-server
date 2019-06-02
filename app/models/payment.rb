class Payment < ApplicationRecord
  belongs_to :campaign
  belongs_to :user

  validates :method, :kind, :value, presence: true
end
