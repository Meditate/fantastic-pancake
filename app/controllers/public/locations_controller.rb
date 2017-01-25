class Public::LocationsController < ApplicationController
  def show
    facade = ShowFacade.new(params)

    if facade.locations
      render json: facade.locations.to_json, status: 200
    else
      render json: { errors: "Country not found" }, status: 422
    end
  end
end
