class Api::V1::HousesController < ApiController
  skip_before_action :authenticate_user!
  def index
    houses = House.all
    render json: houses, status: 200
  end

  def create
    image = params[:house][:house_image]
    params = house_params.except(:house_image)
    house = current_user.houses.create(params)

    if image.present?
      house.images.attach(image)
    else
      @error = ["Image can`t be blank"]
    end
    
    house_url = house.image_url(house.images)
    house.image = house_url

    if house.save
      render json: { house: house }, status: 200
    else
      render json: {message: house.errors.full_messages }, status: 400
    end
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
      house = House.find(params[:house_id])
      house.image =  house.image_url(house.images)
      current_user.favourited_houses << house
      render json: { message: "House successfuly added to your favourites" }
    end
  end

  def unfavourite
    favourite = current_user.favourites.find_by(house_id: params[:house_id])
    favourite&.delete
    render json: { message: 'Successfuly removed' }
  end

  private
  
  def house_params
    params.require(:house).permit(:name, :description, :price, :built_date, :number_of_rooms, :location, :image, :house_image)
  end
end
