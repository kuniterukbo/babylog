class Room < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :gender
  has_many :room_users, dependent: :destroy
  has_many :users, through: :room_users
  has_one_attached :image
  has_many :comments
  has_many :posts, dependent: :destroy
  
  validates :gender_id, numericality: { other_than: 1 } 


  with_options presence: true do
    validates :babyname
    validates :gender_id
    validates :user_id
    validates :birthday
    validates :image
  end
end
