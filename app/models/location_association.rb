class LocationAssociation < ApplicationRecord
  belongs_to :location_group
  belongs_to :location
end
