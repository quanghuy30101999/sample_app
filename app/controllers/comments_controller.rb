class CommentsController < ApplicationController
    
  def create
    @micropost = Micropost.find(params[:micropost_id]) 
    @comment = @micropost.comments.build(params[:comment].permit(:body))
    @comment.user_id = current_user.id
    @comment.save!
    redirect_to micropost_path(@micropost)
  end

  def destroy
    @micropost = Micropost.find(params[:micropost_id])
    @comment = @micropost.comments.find(params[:id])
    @comment.destroy
    redirect_to micropost_path(@micropost)
  end

  def edit
    @comment = Comment.find(params[:id])
  end
  
  def update
    @micropost = Micropost.find(params[:micropost_id])
    @comment = @micropost.comments.find(params[:id])
    if @comment.update(comment_params)
      flash[:success] = "Profile updated"
      redirect_to micropost_path(@micropost)
    else
      render 'edit'
    end
  end

  private
    def comment_params
      params[:comment].permit(:body)
    end
end