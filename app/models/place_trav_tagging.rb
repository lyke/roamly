class PlaceTravTagging < ApplicationRecord
  belongs_to :place
  belongs_to :place_traveler_type_tag
end
