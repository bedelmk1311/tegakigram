class Public::PostsController < ApplicationController
  #before_action :authenticate_user!
  #before_action :ensure_correct_user, only: [:edit, :update, :destroy]
  # ensure 例外処理 投稿者だけが〜できる

  def new
    @post = Post.new
  end
    
  def create 
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to posts_path
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
    #特定のidのPostImageモデルを格納させる
    @post = Post.find(params[:id])
    @comment = Comment.new
    #コメントを投稿するためのインスタンス変数を定義する（空箱を用意する）
    
  end

  def index_follow
    #後ほど
  end
    
  def index_favorite 
    #後ほど
  end

    
  def edit
    
  end

    
  def update 
    if @post.update(post_params)
      redirect_to post_path(@post), notice: "You have updated book successfully."
    else
      render "edit"
    end
  end

  def destroy
    #削除するPostレコードを取得
    post = Post.find(params[:id])
    post.destroy

    redirect_to posts_path
  end
  


   private

   def post_params # 投稿データを保存するためのストロングパラメーター
     params.require(:post).permit(:body)
   end
 
   def ensure_correct_user #現在のユーザーがPostのユーザー同一かどうか
    @post = Post.find(params[:id])
    unless @post.user == current_user
      redirect_to post_path
    end
  end

end
