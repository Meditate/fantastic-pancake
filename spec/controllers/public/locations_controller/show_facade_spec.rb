require "rails_helper"

RSpec.describe Public::LocationsController::ShowFacade do
  let(:facade) { described_class.new(country_code: "test") }
  let(:country) { instance_double(Country, panel_provider: provider) }
  let(:provider) do
    instance_double(PanelProvider, location_groups: raw_locations)
  end

  before do
    allow(facade).to receive(:country).and_return(country)
  end

  xdescribe "#locations" do
    let(:raw_locations) { instance_double(Location, cache_key: "test") }

    before do
      allow(facade).to receive(:raw_locations).and_return(raw_locations)
    end

    it "returns locations" do
      expect(facade.locations).to eq raw_locations
    end
  end
end
