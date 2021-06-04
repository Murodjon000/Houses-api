class HouseSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :price, :date, :images,  :rooms, :location
  belongs_to :user
  has_many :favourites
  has_many :favouritors, through: :favourites, source: :user
 

  def images
    if object.images.attached?
      object.images.blob.url
    end
  end

end
