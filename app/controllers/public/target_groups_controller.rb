class Public::TargetGroupsController < ApplicationController
  def show
    facade = ShowFacade.new(params)

    if facade.target_groups
      target_groups = facade.target_groups.to_json
      render json: JSON.pretty_generate(JSON.parse(target_groups)), status: 200
    else
      render json: { errors: "Country not found" }, status: 422
    end
  end
end
