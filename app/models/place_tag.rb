class PlaceTag < ApplicationRecord
  has_many :place_taggings, dependent: :destroy
  has_many :places, through: :place_taggings
end
