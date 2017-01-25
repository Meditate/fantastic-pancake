class Public::LocationsController < ApplicationController
  def show
    facade = ShowFacade.new(params)

    if facade.locations
      locations = facade.locations.to_json
      render json: JSON.pretty_generate(JSON.parse(locations)), status: 200
    else
      render json: { errors: "Country not found" }, status: 422
    end
  end
end
