class Public::RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    user = User.find(params[:user_id])
    current_user.follow(user) #followはuserモデルで定義 ログインユーザーがfollowする
    redirect_to request.referer, notice: "フォローしました"
    #直前に見ていたURL=同じページに戻る
  end

  def destroy 
    user = User.find(params[:user_id])
    current_user.unfollow(user) #unfollowはuserモデルで定義 ログインユーザーがunfollowする
    redirect_to request.referer , notice: "フォローを外しました"
  end

  def followings
    @user = User.find(params[:user_id])
    #対象のuserを特定
    @users = @user.followings
    #特定のユーザーがフォローしているユーザーの一覧を表示するためのアクション
  end

  def followers 
    @user = User.find(params[:user_id])
    @users = @user.followers
    #特定のユーザーをフォローしているユーザーの一覧を表示するためのアクション
  end
end
