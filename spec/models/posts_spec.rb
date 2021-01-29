require 'rails_helper'

describe Post, type: :model do
  before do
    user = FactoryBot.create(:user)
    room = FactoryBot.create(:room, user_id: user.id)
    @post = FactoryBot.create(:post, user_id: user.id, room_id: room.id )
    sleep(1)
  end

  describe '写真投稿' do
    context '写真投稿できる時' do
      it "情報が適切に入力されていれば保存できる" do
        @post.valid?
      end

      it "event_idが空でも保存できる" do
        @post.event_id = ""
        @post.valid?
      end

      it "event_idが1(--)でも保存できる" do
        @post.event_id = 1
        @post.valid?
      end
      it "shooting_dateが空でも保存できる" do
        @post.shooting_date = ""
        @post.valid?
      end
    end

    context '写真投稿できない時' do
      it "room_idが空のとき保存できない" do
        @post.room_id = ""
        @post.valid?
        expect(@post.errors.full_messages).to include("Room can't be blank")
      end
      it "user_idが空のとき保存できない" do
        @post.user_id = ""
        @post.valid?
        expect(@post.errors.full_messages).to include("User can't be blank")
      end
      it "imageが空のとき保存できない" do
        @post.image = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("Image can't be blank")
      end

    end
  end
end