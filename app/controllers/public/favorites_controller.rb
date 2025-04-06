class Public::FavoritesController < ApplicationController
  def create
    post = Post.find(param[:post_id]) #idではだめ
    @favorite = current_user.favorites.new(post_id: post_id) #なんで複数形なんだっけ？
    @favorite.save
    render 'replace_btn'

  end
    
  def destroy 
    post = Post.find(params[:post_id])
    @favorite = current_user.favorites.find_by(post_id: post.id)
    @favorite.destroy
    render 'replace_btn'
  end
end
