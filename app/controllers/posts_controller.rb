class PostsController < ApplicationController

  def index
    @posts = Post.includes(:room)
    @room = Room.find(params[:room_id])
    # @posts = @room.post.all
  end

  def new
    @room = Room.find(params[:room_id])
    @post = Post.new
  end

  def create
    @room = Room.find(params[:room_id])
    @post = Post.new(post_params)
    if @post.save
      redirect_to action: :index
    else
      render :new
    end
  end

  private
  def post_params
    room = Room.find(params[:room_id])
    params.require(:post).permit(:shooting_date, :event_id, :image).merge(room_id: room.id )
  end

end
