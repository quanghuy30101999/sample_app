class CommentsController < ApplicationController
    
  def create
    @micropost = Micropost.find(params[:micropost_id]) 
    @comment = @micropost.comments.build(params[:comment].permit(:body))
    @comment.user_id = current_user.id
    @comment.save!
    redirect_to micropost_path(@micropost)
  end
end
    