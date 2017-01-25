require "rails_helper"

RSpec.describe Public::LocationsController::ShowFacade do
  let(:facade) { described_class.new(country_code: "test") }
  let(:country) { instance_double(Country) }
  let(:location_group) { instance_double(LocationGroup, locations: [1, 2, 3]) }
  let(:panel_provider) do
    instance_double(PanelProvider, location_groups: [location_group])
  end

  before do
    allow(Country).to receive(:find_by).and_return(country)
    allow(country).to receive(:panel_provider).and_return(panel_provider)
  end

  describe "#lcoations" do
    it "returns locations array" do
      expect(facade.locations).to eq [1, 2, 3]
    end
  end
end
