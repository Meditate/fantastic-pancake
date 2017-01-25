class Private::BaseController < ApplicationController
  before_action :authenticate_user

  private

  def authenticate_user
    authenticate_or_request_with_http_token do |token, _request|
      ApiKey.find_by(key: token)
    end
  end
end
