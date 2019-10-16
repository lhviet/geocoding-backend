Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do

      resources :markers

      namespace :geocoding do
        get 'query'
        get 'reverse'
      end

    end
  end
end
