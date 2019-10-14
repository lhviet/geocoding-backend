Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :markers
      get 'geocoding/query'
      get 'geocoding/reverse'
    end
  end
end
