class PlaceTag < ApplicationRecord
  has_many :place_taggings
  has_many :places, through: :place_taggings
end
