class Country < ApplicationRecord
  belongs_to :panel_provider

  has_many :location_groups
  has_many :country_associations
  has_many :target_groups, through: :country_associations
end
