class Location < ApplicationRecord
  has_many :location_associations
  has_many :location_groups, through: :location_associations
end
