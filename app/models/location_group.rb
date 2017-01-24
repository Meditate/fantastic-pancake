class LocationGroup < ApplicationRecord
  belongs_to :country
  belongs_to :panel_provider
  has_many :location_associations
  has_many :locations, through: :location_associations
end
