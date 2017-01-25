require "rails_helper"

RSpec.describe Public::TargetGroupsController, type: :controller do
  describe "GET #show" do
    let(:facade) do
      instance_spy(described_class::ShowFacade, target_groups: [:target_group])
    end

    it "calls IndexFacade" do
      allow(described_class::ShowFacade).to receive(:new).and_return(facade)
      get :show, params: { country_code: "test" }
      expect(response).to have_http_status(:success)
      expect(facade).to have_received(:target_groups).twice
    end
  end
end
