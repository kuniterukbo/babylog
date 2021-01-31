class Comment < ApplicationRecord

  belongs_to :user
  belongs_to :post



  with_options presence: true do
    validates :text
    validates :user_id
    validates :room_id
    validates :post_id

  end
end
