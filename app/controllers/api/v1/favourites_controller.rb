class Api::V1::FavouritesController < ApiController
  def index
    favourites = current_user.favourited_houses
    render json: { user: current_user, favourites: favourites }
  end
  
end
