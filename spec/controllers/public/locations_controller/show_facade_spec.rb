require "rails_helper"

RSpec.describe Public::LocationsController::ShowFacade do
  let(:facade) { described_class.new(country_code: "test") }
  let(:country) { instance_double(Country) }
  let(:location_groups) { [] }
  let(:panel_provider) do
    instance_double(PanelProvider, location_groups: location_groups)
  end

  before do
    allow(Country).to receive(:find_by).and_return(country)
    allow(country).to receive(:panel_provider).and_return(panel_provider)
    allow(location_groups).to receive(:map).and_return [[1, 2, 3]]
  end

  describe "#lcoations" do
    it "returns locations array" do
      expect(facade.locations).to eq [1, 2, 3]
    end
  end
end
