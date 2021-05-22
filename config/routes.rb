Rails.application.routes.draw do
  devise_for :users

  namespace :api do
    namespace :v1 do
      post :auth, to: "authentication#create"
      resources :favourites
      resources :users
      resources :houses, only: [:index, :show] do
        post 'favourite', to: 'houses#favourite'
        post 'unfavourite', to: 'houses#unfavourite'
      end
    end
  end
end
