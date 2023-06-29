class Place < ApplicationRecord
  belongs_to :user

  has_many :place_trav_taggings
  has_many :place_traveler_type_tags, through: :place_trav_taggings

  has_many :place_taggings
  has_many :place_tags, through: :place_taggings

  geocoded_by :address
  has_many_attached :photos
  after_validation :geocode, if: :will_save_change_to_address?
end
