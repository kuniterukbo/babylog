class Post < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :event
  belongs_to :room
  has_one_attached :image
  has_many :comments, dependent: :destroy
end
