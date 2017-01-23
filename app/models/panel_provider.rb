class PanelProvider < ApplicationRecord
  has_many :countries
  has_many :location_groups
end
