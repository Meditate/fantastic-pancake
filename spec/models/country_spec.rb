require "rails_helper"

RSpec.describe Country, type: :model do
  describe "database columns" do
    it { is_expected.to have_db_column(:id) }
    it { is_expected.to have_db_column(:created_at) }
    it { is_expected.to have_db_column(:updated_at) }
    it { is_expected.to have_db_column(:panel_provider_id) }
    it { is_expected.to have_db_column(:country_code) }
  end

  describe "relations" do
    it { is_expected.to belong_to(:panel_provider) }
    it { is_expected.to have_many(:location_groups) }
  end
end
