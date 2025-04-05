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
    
  end

    
  def show
    
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
