class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :favourites
  has_many :favourited_houses, through: :favourites, source: :house

  validates :username, uniqueness: true, presence: true, length: { minimum: 3, maximum: 15 }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: "Must be valid email address" }

  has_one_attached :avatar
  has_many :houses

  def self.avatar_url(avatar)
    if avatar.attached?
      avatar.blob.url
    end
  end
end
