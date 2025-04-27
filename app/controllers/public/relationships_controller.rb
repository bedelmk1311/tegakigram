class Public::RelationshipsController < ApplicationController
  def create
    user = User.find(params[:user_id])
    current_user.follow(user) #followはuserモデルで定義 ログインユーザーがfollowする
    back_redirect_by_notice("フォローしました")
  end

  def destroy 
    user = User.find(params[:user_id])
    current_user.unfollow(user) #unfollowはuserモデルで定義 ログインユーザーがunfollowする
    back_redirect_by_notice("フォローを外しました")
  end

  def followings
    @user = User.find(params[:user_id])
    @users = @user.followings
    #特定のユーザーがフォローしているユーザーの一覧を表示するためのアクション
  end

  def followers 
    @user = User.find(params[:user_id])
    @users = @user.followers
    #特定のユーザーをフォローしているユーザーの一覧を表示するためのアクション
  end
end
