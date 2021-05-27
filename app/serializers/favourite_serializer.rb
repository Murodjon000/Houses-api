class FavouriteSerializer < ActiveModel::Serializer
  belongs_to :user
  belongs_to :house
end
