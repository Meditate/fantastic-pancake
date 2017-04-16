class Public::LocationsController::ShowFacade
  def initialize(params)
    self.params = params
  end

  def locations
    return unless country
    Rails.cache.fetch(raw_locations.cache_key, expires_in: 30.seconds) do
      raw_locations
    end
  end

  delegate :panel_provider, to: :country
  delegate :location_groups, to: :panel_provider

  private

  attr_accessor :params

  def country
    Country.find_by(country_code: params[:country_code])
  end

  def raw_locations
    @_raw_locations ||=
      location_groups.map do |location_group|
        location_group.locations.select(:name, :external_id)
      end.first
  end
end
