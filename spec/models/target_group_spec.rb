require "rails_helper"

RSpec.describe TargetGroup, type: :model do
  describe "database columns" do
    it { is_expected.to have_db_column(:id) }
    it { is_expected.to have_db_column(:created_at) }
    it { is_expected.to have_db_column(:updated_at) }
    it { is_expected.to have_db_column(:name) }
    it { is_expected.to have_db_column(:external_id) }
    it { is_expected.to have_db_column(:parent_id) }
    it { is_expected.to have_db_column(:panel_provider_id) }
    it { is_expected.to have_db_column(:secret_code) }
  end

  describe "relations" do
    it { is_expected.to belong_to(:panel_provider) }
    it { is_expected.to belong_to(:parent) }
    it { is_expected.to have_many(:subgroups) }
  end
end
