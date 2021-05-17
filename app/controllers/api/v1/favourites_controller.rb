class Api::V1::FavouritesController < ApiController
  def create
    favourite = current_user.favourites.new(set_params)

    if favourite.save
      render json: @favourite, status: 200
    else
      render json: {error:"House was not added to the favourites."},status: 404
    end
  end

  def destroy
    favourite = current_user.favourites.find(params[:id])
    if favourite
      favourite.destroy
      render json: {message: 'Successfuly removed',removed_item: favourite}, status:200
    else
      render json: {error: 'Sorry house could not be removed'},status: 422 
    end
  end

  private

  def set_params
    params.permit(:house_id)
  end
end