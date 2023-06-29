class TravelTag < ApplicationRecord
  has_many :travel_taggings
  has_many :travels, through: :travel_taggings
end
