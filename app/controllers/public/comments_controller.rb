class Public::CommentsController < ApplicationController

  def index 
  end

  def create
    @post =Post.find(params[:post_id]) #修正:idだとcomment_idを代入してしまう
    @comment = current_user.messages.new(comment_params)
    post.id = @comment.post_id #
    @comment.save
    redirect_to post_path(post) #その投稿に戻る
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
