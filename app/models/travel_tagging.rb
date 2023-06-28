class TravelTagging < ApplicationRecord
  belongs_to :travel
  belongs_to :travel_tag
end
