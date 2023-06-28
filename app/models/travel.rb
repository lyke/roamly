class Travel < ApplicationRecord
  belongs_to :user
  validates :beginning_date, presence: true
  validates :ending_date, presence: true
  validates :budget, presence: true
  validates :nb_traveler, presence: true
  validates :start_hour, presence: true
  validates :end_hour, presence: true
  validates :starting_point, presence: true
end

