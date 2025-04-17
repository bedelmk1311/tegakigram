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

  end

  # def destroy_comment
  # end

end
