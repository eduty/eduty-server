class Campus < ApplicationRecord
  has_many :courses
  belongs_to :institution
end
