class House < ApplicationRecord
  belongs_to :user
  has_one_attached :images
  has_many :favourites
  has_many :favouritors, through: :favourites, source: :user
  validates_presence_of :name, :description, :price, :date, :rooms, :location
  validates :price, numericality: { greater_than: 0 }
  validates :rooms, numericality: { greater_than: 1 }

  def image_url(images)
    if images.attached?
      images.blob.url
    end
  end

end
