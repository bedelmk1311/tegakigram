class Admin::UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def index 
    @users = User.all
  end

  # def index_comments
  # end
  # def comfirm_post
  # end
  # def comfirm_post
  # end

  def destroy
    @user.destroy
    redirect_to admin_users_path , notice: "アカウント削除に成功しました"
  end

  # def destroy_comment
  # end

end
