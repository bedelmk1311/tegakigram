class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  def show
    @user = User.find(params[:id])
  end

  def index 
    @users = User.page(params[:page]).per(3)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path , notice: "アカウント削除に成功しました"
  end

end
