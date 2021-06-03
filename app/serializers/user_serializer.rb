class UserSerializer < ActiveModel::Serializer
  has_many :favourites
  has_many :houses
  has_many :favourited_houses, through: :favourites, source: :house

end
