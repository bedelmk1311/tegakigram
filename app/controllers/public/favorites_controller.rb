class Public::FavoritesController < ApplicationController
  def create
    @post = Post.find(params[:post_id]) #idではだめ
    @favorite = current_user.favorites.new(post_id: @post.id) #なんで複数形なんだっけ？
    @favorite.save
    #render 'replace_btn'
    redirect_to post_path(@post) , notice: "いいねしました"
  end
    
  def destroy 
    @post = Post.find(params[:post_id])
    @favorite = current_user.favorites.find_by(post_id: @post.id)
    @favorite.destroy
    #render 'replace_btn'
    redirect_to post_path(@post) , notice: "いいねを取り消しました"
  end
end
