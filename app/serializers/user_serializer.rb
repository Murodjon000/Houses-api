class UserSerializer < ActiveModel::Serializer
  has_many :favourites
  has_many :favourited_houses, through: :favourites, source: :house
end
