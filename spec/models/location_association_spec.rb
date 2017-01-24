require "rails_helper"

RSpec.describe LocationAssociation, type: :model do
  describe "database columns" do
    it { is_expected.to have_db_column(:id) }
    it { is_expected.to have_db_column(:created_at) }
    it { is_expected.to have_db_column(:updated_at) }
    it { is_expected.to have_db_column(:location_group_id) }
    it { is_expected.to have_db_column(:location_id) }
  end

  describe "relations" do
    it { is_expected.to belong_to(:location_group) }
    it { is_expected.to belong_to(:location) }
  end
end
