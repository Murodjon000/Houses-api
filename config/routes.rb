Rails.application.routes.draw do
  devise_for :users

  namespace :api do
    namespace :v1 do
      post :auth, to: "authentication#create"
      resources :favourites
      resources :users
      resources :houses do
        post 'favourite', to: 'houses#favourite'
        post 'unfavourite', to: 'houses#unfavourite'
      end
      post '/presigned_url', to: 'direct_upload#create'
    end
  end

end
