class RoomsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    room = Room.find(params[:id])
    room_users = RoomUser.where(id: room.room_users.ids)
    room_users.each do |room_user|
      room_user.destroy
    end
    room.destroy
    redirect_to root_path
  end

  private
  def room_params
    params.require(:room).permit(:babyname, :gender_id, :birthday, :image, user_ids: []).merge(user_id: current_user.id)
  end


end
