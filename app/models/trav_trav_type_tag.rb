class TravTravTypeTag < ApplicationRecord
  has_many :trav_trav_taggings, dependent: :destroy
  has_many :travels, through: :trav_trav_taggings
end
