require 'rails_helper'

describe Room, type: :model do
  before do
    user = FactoryBot.create(:user)
    @room = FactoryBot.build(:room, user_id: user.id)
  end

  describe 'ルームの作成' do
    context 'ルームが作成できるとき' do
      it "情報が適切に入力されていれば保存できる" do
        @room.valid?
      end
    end

    context 'ルーム作成がうまくいかないとき' do
      it "babynameが空の時保存されない" do
        @room.babyname = ""
        @room.valid?
        expect(@room.errors.full_messages).to include("Babyname can't be blank")
      end

      it "gender_idが1(--)の時保存されない" do
        @room.gender_id = 1
        @room.valid?
        expect(@room.errors.full_messages).to include("Gender must be other than 1")
      end
      
      it "gender_idが空の時保存されない" do
        @room.gender_id = ""
        @room.valid?
        expect(@room.errors.full_messages).to include("Gender can't be blank")
      end

      it "user_idが空の時は保存されない" do
        @room.user_id = ""
        @room.valid?
        expect(@room.errors.full_messages).to include("User can't be blank")
      end
      it "画像ファイルが空の時保存されない" do
        @room.image = nil
        @room.valid?
        expect(@room.errors.full_messages).to include("Image can't be blank")
      end

    end
  end
end