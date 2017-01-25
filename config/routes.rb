Rails.application.routes.draw do
  namespace :public do
    resources :locations, only: [:show], param: :country_code
    resources :target_groups, only: [:show], param: :country_code
  end
end
