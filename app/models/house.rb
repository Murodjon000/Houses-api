class House < ApplicationRecord
  has_many :favourites
  validates_presence_of :name, :description, :price, :image, :built_date, :number_of_rooms, :location
end
