class User < ApplicationRecord
  has_one :user_balance

  before_create :generate_slug

  def generate_slug
    self.slug = self.name.parameterize
  end
end
