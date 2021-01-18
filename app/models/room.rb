class Room < ApplicationRecord
  belongs_to :gender
  validates :gender_id, numericality: { other_than: 1 } 
end
