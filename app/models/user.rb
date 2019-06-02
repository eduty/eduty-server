class User < ApplicationRecord
  has_many :campaigns

  validates :email, :name, :password, presence: true

  before_create :generate_slug

  def generate_slug
    self.slug = self.name.parameterize
  end
end
