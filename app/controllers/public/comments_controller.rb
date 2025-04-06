class Public::CommentsController < ApplicationController

  def index 
  end

  def create
    @post =Post.find(params[:post_id]) #修正:idだとcomment_idを代入してしまう
    #@comment = Comment.new(comment_params) #修正
    @comment = current_user.messages.new(comment_params)
    post_id = @comment.post_id #
    @comment.save
  end
    
  def destroy 
    @comment = Comment.find(params[:id])
    @comment.destroy
  end

  private
  def comment_params
    params.require(:comment).permit(:message)
  end
end
