class CommentsController < ApplicationController

  def create
    comment = Comment.new(comment_params)
    comment.save
    redirect_to room_post_path(params[:room_id], params[:post_id],)
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(room_id: params[:room_id], post_id: params[:post_id], user_id: current_user.id)
  end
end
