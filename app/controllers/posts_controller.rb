class PostsController < ApplicationController

  def index
    @posts = Post.includes(:room)
    @room = Room.find(params[:room_id])
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

  def show
    @room = Room.find(params[:room_id])
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
    params.require(:post).permit(:shooting_date, :event_id, :image).merge(room_id: room.id )
  end

end
