class Room < ApplicationRecord
  belongs_to :gender
  has_many :room_users
  has_many :users, through: :room_users
  
  validates :gender_id, numericality: { other_than: 1 } 
end
