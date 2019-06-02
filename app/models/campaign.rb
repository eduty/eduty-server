class Campaign < ApplicationRecord
  belongs_to :user
  belongs_to :course
  has_many :campaign_media, class_name: 'CampaignMedia'
end
