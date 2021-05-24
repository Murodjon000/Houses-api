class Api::V1::HousesController < ApiController
  def index
    houses = House.all
    render json: houses, status: 200
  end

  def show
    house = House.find(params[:id])
    if house
      render json: house, status: 200
    else
      render json: { error: 'House was not found.' }, status: 404
    end
  end

  def favourite
    if current_user.favourites.exists?(house_id: params[:house_id])
      render json: { message: 'You\'ve already favourited this house!' }, status: :forbidden
    else
      current_user.favourited_houses << House.find(params[:house_id])
      render json: { message: 'House successfuly added to the favourites.' }
    end
  end

  def unfavourite
    favourite = current_user.favourites.find_by(house_id: params[:house_id])
    favourite&.delete
    render json: { message: 'Successfuly removed' }
  end
end
