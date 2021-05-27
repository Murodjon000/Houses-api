class House < ApplicationRecord
  has_many :favourites
  has_many :favouritors, through: :favourites, source: :user
  validates_presence_of :name, :description, :price, :image, :built_date, :number_of_rooms, :location
end
