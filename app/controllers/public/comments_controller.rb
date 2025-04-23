class Public::CommentsController < ApplicationController

  def index 
  end

  def create
    @post =Post.find(params[:post_id]) #修正:idだとcomment_idを代入してしまう
    @comment = current_user.comments.new(comment_params) #現在のuserのコメントを作成する（messageを受け取って）
    @comment.post_id = @post.id 
    if @comment.save
      #redirect_to post_path(@post), notice: "コメントの投稿に成功しました" #戻る
      back_redirect_by_notice("コメントの投稿に成功しました")
    else
      render 'error' 
    end
  end

  def destroy 
    @post =Post.find(params[:post_id]) 
    @comment = Comment.find(params[:id])
    @comment.destroy
    #redirect_to post_path(@post) , notice: "コメント削除の削除に成功しました" #戻る
    back_redirect_by_notice("コメントの削除に成功しました")
  end

  private
  def comment_params
    params.require(:comment).permit(:message)
  end
end