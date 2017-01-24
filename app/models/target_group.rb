class TargetGroup < ApplicationRecord
  has_many :country_associations
  has_many :countries, through: :country_associations
  has_many :subgroups, class_name: "TargetGroup", foreign_key: "parent_id"
  belongs_to :panel_provider
  belongs_to :parent, class_name: "TargetGroup",
                      foreign_key: "parent_id",
                      optional: true
end
