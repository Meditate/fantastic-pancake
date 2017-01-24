require "rails_helper"

RSpec.describe CountryAssociation, type: :model do
  describe "database columns" do
    it { is_expected.to have_db_column(:id) }
    it { is_expected.to have_db_column(:created_at) }
    it { is_expected.to have_db_column(:updated_at) }
    it { is_expected.to have_db_column(:target_group_id) }
    it { is_expected.to have_db_column(:country_id) }
  end

  describe "relations" do
    it { is_expected.to belong_to(:country) }
    it { is_expected.to belong_to(:target_group) }
  end
end
