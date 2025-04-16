class Public::PostsController < ApplicationController
  before_action :authenticate_user! ,except: [:index]
  before_action :ensure_correct_user, only: [:edit, :update, :destroy, :index_favorite]
  # ensure 例外処理 投稿者だけが〜できる

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
    @posts = Post.all
    #@post = Post.new # 後でサイドバーから投稿する用
    #@posts = PostImage.page(params[:page]) #メシテロのようにするならば
    #1ページ分の決められた数のデータだけを、新しい順に取得
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new #コメントを投稿するためのインスタンス変数を定義する
  end

  # def index_favorite 下のに修正
    # @posts_favorite = Post.where(favorites: { user_id: current_user.id })
    # ユーザーがいいねしたレコードを絞り込み
  # end

  def index_favorite 
    @posts_favorite = current_user.favorites.map(&:post)
    #ユーザーが持ついいねのデータをpostメソッドを適用にして表示　
  end

  def index_follow
    #後ほど
  end

  def edit
  end

  def update 
    if @post.update(post_params)
      redirect_to post_path(@post), notice: "投稿の編集内容は保存されました"
       #showに戻るか一覧に戻るか迷い中
    else
      render "edit"
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
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
