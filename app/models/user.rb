class User < ApplicationRecord
  has_many :places
  has_many :travels
  has_one_attached :photo
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  validates :nickname, uniqueness: {
    message: ->(object, data) do
      "Sorry #{object.name}, #{data[:value]} is already taken."
    end
  }
end

