class Place < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :duration, presence: true, numericality: { greater_than: 0 }
  validates :address, presence: true

  has_many :place_trav_taggings
  has_many :place_traveler_type_tags, through: :place_trav_taggings

  has_many :place_taggings
  has_many :place_tags, through: :place_taggings

  geocoded_by :address
  has_many_attached :photos
  after_validation :geocode, if: :will_save_change_to_address?
end
