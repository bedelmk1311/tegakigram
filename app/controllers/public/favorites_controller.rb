class Public::FavoritesController < ApplicationController
  def create
    @post = Post.find(params[:post_id]) #idではだめ
    @favorite = current_user.favorites.new(post_id: @post.id) 
    @favorite.save
    back_redirect_by_notice("いいねしました")
  end

  def destroy 
    @post = Post.find(params[:post_id])
    @favorite = current_user.favorites.find_by(post_id: @post.id)
    @favorite.destroy
    back_redirect_by_notice("いいねを取り消しました")
  end
end
