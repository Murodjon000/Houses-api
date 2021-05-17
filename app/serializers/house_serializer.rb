class HouseSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :price, :image, :built_date, :number_of_rooms, :location

  has_many :favourites
end
