class CountryAssociation < ApplicationRecord
  belongs_to :target_group
  belongs_to :country
end
