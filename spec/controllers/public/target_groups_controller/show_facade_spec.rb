require "rails_helper"

RSpec.describe Public::TargetGroupsController::ShowFacade do
  let(:facade) { described_class.new(country_code: "test") }
  let(:country) { instance_double(Country) }
  let(:target_groups) { class_double(TargetGroup) }
  let(:panel_provider) do
    instance_double(PanelProvider, target_groups: target_groups)
  end

  before do
    allow(Country).to receive(:find_by).and_return(country)
    allow(country).to receive(:panel_provider).and_return(panel_provider)
    allow(target_groups).to receive(:select).and_return([1, 2, 3])
  end

  describe "#lcoations" do
    it "returns locations array" do
      expect(facade.target_groups).to eq [1, 2, 3]
    end
  end
end
