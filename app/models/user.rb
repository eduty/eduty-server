class User < ApplicationRecord
  has_one :user_balance
  has_many :campaigns

  before_create :generate_slug

  def generate_slug
    self.slug = self.name.parameterize
  end
end
