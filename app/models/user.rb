class User < ApplicationRecord
  has_many :room_users
  has_many :rooms, through: :room_users
  has_many :posts
  has_many :comments
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
end
