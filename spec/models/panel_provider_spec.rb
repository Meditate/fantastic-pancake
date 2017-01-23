require "rails_helper"

RSpec.describe PanelProvider, type: :model do
  describe "database columns" do
    it { is_expeted.to have_db_column(:id) }
    it { is_expeted.to have_db_column(:created_at) }
    it { is_expeted.to have_db_column(:updated_at) }
    it { is_expeted.to have_db_column(:code) }
  end
end
