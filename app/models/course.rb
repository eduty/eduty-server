class Course < ApplicationRecord
  belongs_to :institution
  belongs_to :campus
end
