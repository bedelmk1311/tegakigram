class Public::FavoritesController < ApplicationController
  def create
    @post = Post.find(params[:post_id]) #idではだめ
    @favorite = current_user.favorites.new(post_id: @post.id) #なんで複数形なんだっけ？
    @favorite.save
    #render 'replace_btn'
    redirect_to request.referer, notice: "いいねしました"
    #直前に見ていたURL=同じページに戻る
  end

  def destroy 
    @post = Post.find(params[:post_id])
    @favorite = current_user.favorites.find_by(post_id: @post.id)
    @favorite.destroy
    #render 'replace_btn'
    redirect_to request.referer, notice: "いいねを取り消しました"
    #back_redirect_by_notice("なんかメッセージ")
  end
end
