class Country < ApplicationRecord
  belongs_to :panel_provider

  has_many :location_groups
end
