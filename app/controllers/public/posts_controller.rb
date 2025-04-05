class Public::PostsController < ApplicationController

  def new
    @post = Post.new
  end
    
  def create 
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to post_path
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
    
  end
    
  def index_favorite 
    
  end

    
  def edit
    
  end

    
  def update 
    
  end

  def destroy

  end
  

   # 投稿データを保存するためのストロングパラメーター
   private

   def post_params
     params.require(:post).permit(:body, :post_image)
   end
 

end
