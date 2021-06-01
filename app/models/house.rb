class House < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :favourites
  has_many :favouritors, through: :favourites, source: :user
  validates_presence_of :name, :description, :price,  :built_date, :number_of_rooms, :location

  def image_url
    if image.attached?
      image.blob.service_url
    end
  end
end
