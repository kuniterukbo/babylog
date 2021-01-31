require 'rails_helper'

describe Post, type: :model do
  before do
    user = FactoryBot.create(:user)
    room = FactoryBot.create(:room, user_id: user.id)
    post = FactoryBot.create(:post, user_id: user.id, room_id: room.id )
    @comment = FactoryBot.create(:comment, user_id: user.id, room_id: room.id, post_id: post.id )
    sleep(1)
  end

  describe 'コメント投稿' do
    context 'コメント投稿できる時' do
      it "情報が適切に入力されていれば投稿できる" do
        @comment.valid?
      end    
    end

    context 'コメント投稿できない時' do
      it "textが空だと投稿できない" do
        @comment.text = ""
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Text can't be blank")
      end
      it "user_idが空だと投稿できない" do
        @comment.user_id = ""
        @comment.valid?
        expect(@comment.errors.full_messages).to include("User must exist")
      end
      it "room_idが空だと投稿できない" do
        @comment.room_id = ""
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Room can't be blank")
      end
      it "post_idが空だと投稿できない" do
        @comment.post_id = ""
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Post must exist")
      end
  
    end
  end
end