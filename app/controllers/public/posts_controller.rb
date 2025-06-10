class Public::PostsController < ApplicationController
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]

  def new
    @post = Post.new
  end

  def create 
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to posts_path, notice: "投稿に成功しました"
    else
      render :new
    end
  end

  def index
    @posts = Post.all.order(created_at: :desc).page(params[:page]).per(6)
    #.page(params[:page])で　1ページ分の決められた数のデータだけを、新しい順に取得
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @user = @post.user
  end

  #user側に変更
  # def index_favorite 
  # end
  # def index_follow
  # end

  def edit
  end

  def update 
    if @post.update(post_params)
      back_redirect_by_notice("投稿の編集内容は保存されました")
    else
      render "edit"
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice:"投稿の削除に成功しました"
  end

  private

  def post_params # 投稿データを保存するためのストロングパラメーター
    params.require(:post).permit(:body, :post_image)
  end

  def ensure_correct_user #現在のユーザーがPostのユーザー同一かどうか
    @post = Post.find(params[:id])
    unless @post.user == current_user
      redirect_to posts_path
    end
  end

end
