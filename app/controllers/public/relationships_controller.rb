class Public::RelationshipsController < ApplicationController
  #before_action :authenticate_user!
  
  def create
    user = User.find(params[:user_id])
    current_user.follow(user) #userモデルで定義
    redirect_to request.referer, notice: "フォローしました"
    #直前に見ていたURL=同じページに戻る
  end
    
  def destroy 
    user = User.find(params[:user_id])
    current_user.unfollow(user)
		redirect_to request.referer , notice: "フォローを外しました"
  end

    
  def followings
    user = User.find(params[:user_id])
		@users = user.followings
  end

    
  def followers 
    user = User.find(params[:user_id])
		@users = user.followers
  end
end
