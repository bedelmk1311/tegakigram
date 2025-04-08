class Public::CommentsController < ApplicationController

  def index 
  end

  def create
    @post =Post.find(params[:post_id]) #修正:idだとcomment_idを代入してしまう
    @comment = current_user.comments.new(comment_params) #現在のuserのコメントを作成する（messageを受け取って）
    @comment.post_id = @post.id 
    @comment.save
    redirect_to posts_path #戻る
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
