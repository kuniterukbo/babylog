class Room < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :gender
  has_many :room_users
  has_many :users, through: :room_users
  has_one_attached :image
  
  validates :gender_id, numericality: { other_than: 1 } 
  validates :babyname, presence: true

end
