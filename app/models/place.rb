class Place < ApplicationRecord
  belongs_to :user

  has_many :steps, dependent: :destroy
  has_many :travels, through: :steps

  has_many :place_trav_taggings, dependent: :destroy
  has_many :place_traveler_type_tags, through: :place_trav_taggings

  has_many :place_taggings, dependent: :destroy
  has_many :place_tags, through: :place_taggings

  validates :name, presence: true
  validates :description, presence: true, length: { minimum: 10, maximum: 800 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :duration, presence: true, numericality: { greater_than: 0 }
  validates :address, presence: true
  geocoded_by :address
  has_many_attached :photos
  after_validation :geocode, if: :will_save_change_to_address?


  def self.find_for_travel(travel)
    valid_places = all.where(validation: true)
    near_places = valid_places.near(travel.starting_point, 10)
    selected_secret_places = filter_for_secret_spots(near_places, travel.incl_secret)
    # separer les places en 2 listes, local ou touristique et pick dans chaque liste en fonction du pourcentage choisi par le user.
    selected_trav_places = filter_for_traveler_tags(near_places, travel.trav_trav_type_tags)
    selected_places = filter_for_tags(selected_trav_places, travel.travel_tags)
    selected_price_places = filter_for_price(selected_places, travel.budget)
    return filter_for_time(selected_price_places, travel.start_hour, travel.end_hour)
  end

  def self.filter_for_secret_spots(places_to_filter, secret_spot)
    @selected_places = []
    if secret_spot
      @selected_places << places_to_filter
    else
      places_to_filter.each do |place|
        if !place.secret_spot
          @selected_places << place
        end
      end
    end
    return @selected_places
  end

  def self.filter_for_traveler_tags(places_to_filter, traveler_tags)
    @travel_traveler_tags = traveler_tags.flat_map { |traveler_tag| traveler_tag }
    @travel_traveler_tag = TravTravTypeTag.where(id: @travel_traveler_tags.pluck(:id))
    @travel_traveler_tag_name = @travel_traveler_tag.map { |travel_tag_name| travel_tag_name.name }

    @selected_places = []

    places_to_filter.each do |place|
      if place.place_traveler_type_tags.pluck(:tag).include?(@travel_traveler_tag_name.join)
        @selected_places << place
      end
    end
    # @selected_places << places_to_filter.select { |place| place.place_traveler_type_tags.pluck(:tag).include?(@travel_traveler_tag_name) }

    @selected_places.flatten!
    @selected_places.uniq!
    return @selected_places
  end

  def self.filter_for_tags(places_to_filter, tags)
    @travel_tags = tags.flat_map { |travel_tag| travel_tag }
    @travel_tag = TravelTag.where(id: @travel_tags.pluck(:id))
    @travel_tag_names = @travel_tag.map { |tag_name| tag_name.name }

    @selected_places = []

    @travel_tag_names.each do |tag_name|
      @selected_places << places_to_filter.select { |place| place.place_tags.pluck(:name).include?(tag_name) }
    end

    @selected_places.flatten!
    @selected_places.uniq!
    return @selected_places
  end


  def self.filter_for_price(places_to_filter, budget)
    sorted_places = places_to_filter.sort_by(&:price)
    selected_places = []
    total_price = 0
    sorted_places.each do |place|
      if (total_price + place.price) <= budget
        selected_places << place
        total_price += place.price
      else
        break
      end
    end
    return selected_places
  end

  def self.filter_for_time(places_to_filter, start_time, end_time)
    sorted_places = places_to_filter.sort_by(&:duration)
    day_duration = (end_time - start_time) / 60 # passer de secondes à minutes
    selected_places = []
    total_duration = 0
    sorted_places.each do |place|
      if (total_duration + place.duration) <= day_duration
        selected_places << place
        total_duration += place.duration
      else
        break
      end
    end
    return selected_places
  end

  # def self.filter_for_touristic(places_to_filter, touristic, touristic_range)
  #   touristic_place = []
  #   local_place = []
  #   selected_places = []
  #   places_to_filter.each do |place|
  #     if place.touristic
  #       touristic_place << place
  #     else
  #       local_place << place
  #     end

  #   end
  #   return selected_places
  # end


  # def self.filter_for_days(places_to_filter, beg_date, end_date)
  #   nb_days = (end_date - beg_date)
  # end
end
