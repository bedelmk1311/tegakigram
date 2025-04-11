class Public::CommentsController < ApplicationController

  def index 
  end

  def create
    @post =Post.find(params[:post_id]) #修正:idだとcomment_idを代入してしまう
    @comment = current_user.comments.new(comment_params) #現在のuserのコメントを作成する（messageを受け取って）
    @comment.post_id = @post.id 
    if @comment.save
      redirect_to posts_path, notice: "コメントの投稿に成功しました" #戻る
    else
      redirect_to posts_path, notice: "コメントの投稿に失敗しました" #とりあえずの画面遷移
    end
    end
    
  def destroy 
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to posts_path , notice: "コメントは削除されました" #戻る
  end

  private
  def comment_params
    params.require(:comment).permit(:message)
  end
end