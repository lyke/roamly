class PlaceTravelerTypeTag < ApplicationRecord
  has_many :place_trav_taggings, dependent: :destroy
  has_many :places, through: :place_trav_taggings
end
