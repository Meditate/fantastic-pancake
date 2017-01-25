require "rails_helper"

RSpec.describe Public::LocationsController, type: :controller do
  describe "GET #show" do
    let(:facade) do
      instance_spy(described_class::ShowFacade, locations: [:location])
    end

    it "calls IndexFacade" do
      allow(described_class::ShowFacade).to receive(:new).and_return(facade)
      get :show, params: { country_code: "test" }
      expect(response).to have_http_status(:success)
      expect(facade).to have_received(:locations).twice
    end
  end
end
