class Institution < ApplicationRecord
  has_many :courses
  has_many :campuses
end
