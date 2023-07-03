class TravelTag < ApplicationRecord
  has_many :travel_taggings, dependent: :destroy
  has_many :travels, through: :travel_taggings
end
