class Travel < ApplicationRecord
  has_many :steps, dependent: :destroy
  has_many :places, through: :steps
  has_many :travel_taggings, dependent: :destroy
  has_many :travel_tags, through: :travel_taggings
  has_many :trav_trav_taggings, dependent: :destroy
  has_many :trav_trav_type_tags, through: :trav_trav_taggings
  belongs_to :user

  validates :beginning_date, presence: true
  validates :ending_date, presence: true
  validates :budget, presence: true, numericality: { greater_than: 0 }
  validates :nb_traveler, presence: true, numericality: { only_integer: true }
  validates :start_hour, presence: true
  validates :end_hour, presence: true
  validates :starting_point, presence: true
  geocoded_by :starting_point
  after_validation :geocode, if: :will_save_change_to_starting_point?
end
