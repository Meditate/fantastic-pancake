require "rails_helper"

RSpec.describe PanelProvider, type: :model do
  describe "database columns" do
    it { is_expected.to have_db_column(:id) }
    it { is_expected.to have_db_column(:created_at) }
    it { is_expected.to have_db_column(:updated_at) }
    it { is_expected.to have_db_column(:code) }
  end

  describe "relations" do
    it { is_expected.to have_many(:countries) }
    it { is_expected.to have_many(:location_groups) }
  end
end
