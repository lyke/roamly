class PlaceTagging < ApplicationRecord
  belongs_to :place_tag
  belongs_to :place
end
