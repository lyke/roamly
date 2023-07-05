class Place < ApplicationRecord
  belongs_to :user

  has_many :steps, dependent: :destroy
  has_many :travels, through: :steps

  has_many :place_trav_taggings, dependent: :destroy
  has_many :place_traveler_type_tags, through: :place_trav_taggings

  has_many :place_taggings, dependent: :destroy
  has_many :place_tags, through: :place_taggings

  validates :name, presence: true
  validates :description, presence: true, length: { minimum: 10, maximum: 400 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :duration, presence: true, numericality: { greater_than: 0 }
  validates :address, presence: true
  geocoded_by :address
  has_many_attached :photos
  after_validation :geocode, if: :will_save_change_to_address?

  # def self.find_for_travel(travel)
  #   all.sample(5)
  # end
  def self.find_for_travel(travel)
    valid_place = all.where(validation: true)
    @near_places = valid_place.near(travel.starting_point, 10)
    # separer les places en 2 listes, local ou touristique et pick dans chaque liste en fonction du pourcentage choisi par le user.
    selected_places = filter_for_tags(@near_places, travel.travel_tags)
    selected_price_places = filter_for_price(selected_places, travel.budget)
    return filter_for_time(selected_price_places, travel.start_hour, travel.end_hour)
    # return filter_for_days(selected_price_places, travel.beginning_date, travel.ending_date)
  end
end
