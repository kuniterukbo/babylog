class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :unmatched_user_redirect_root_path

  def index
    @posts = Post.includes(:room)
  end

  def new
    @post = Post.new

  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to action: :index
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments.includes(:user)

  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to room_posts_path(params[:room_id])
  end

  private
  def post_params
    room = Room.find(params[:room_id])
    params.require(:post).permit(:shooting_date, :event_id, :image).merge(room_id: room.id, user_id: current_user.id )
  end

  def unmatched_user_redirect_root_path
    @room = Room.find(params[:room_id])
    @room_users = RoomUser.where(id: @room.room_users.ids)
    room_user_id = []
    @room_users.each do |room_user|
      room_user_id << room_user.user.id
    end
    unless room_user_id.include?(current_user.id)
      redirect_to root_path
    end
  end
end
