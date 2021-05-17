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
        render json: { error: 'House was not found.' },status: 404
    end
 end

end