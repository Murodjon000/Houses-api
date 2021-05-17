class UserSerializer < ActiveModel::Serializer
  has_many :favourites
end
