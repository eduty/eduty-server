class User < ApplicationRecord
  has_many :campaigns

  before_create :generate_slug

  def generate_slug
    self.slug = self.name.try(:parameterize) || self.email.try(:parameterize) || rand(41928794).to_s
  end
end
