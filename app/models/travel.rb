class Travel < ApplicationRecord
  has_many :travel_taggings
  has_many :trav_trav_taggings
  belongs_to :user
  geocoded_by :starting_point
  after_validation :geocode, if: :will_save_change_to_starting_point?
end
