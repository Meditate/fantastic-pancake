class Private::LocationsController::ShowFacade
  def initialize(params)
    self.params = params
  end

  def locations
    return unless country
    location_groups.map(&:locations).first
  end

  delegate :panel_provider, to: :country
  delegate :location_groups, to: :panel_provider

  private

  attr_accessor :params

  def country
    Country.find_by(country_code: params[:country_code])
  end
end
