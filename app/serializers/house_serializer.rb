class HouseSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :price, :built_date, :images,  :number_of_rooms, :location
  belongs_to :user
  has_many :favourites
  has_many :favouritors, through: :favourites, source: :user
 

  def images
    if object.images.attached?
      object.images.blob.url
    end
  end

end
