class Private::TargetGroupsController::ShowFacade
  def initialize(params)
    self.params = params
  end

  def target_groups
    return unless country
    panel_provider.target_groups
  end

  delegate :panel_provider, to: :country

  private

  attr_accessor :params

  def country
    Country.find_by(country_code: params[:country_code])
  end
end
