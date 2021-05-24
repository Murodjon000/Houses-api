Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      devise_for :users, controllers: { registrations: 'api/v1/registrations' } do
        resources :classrooms
        resources :notifications
      end
      post :auth, to: "authentication#create"
      resources :favourites
      resources :houses, only: [:index, :show] do
        post 'favourite', to: 'houses#favourite'
        post 'unfavourite', to: 'houses#unfavourite'
      end
    end
  end
end
