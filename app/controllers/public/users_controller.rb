class Public::UsersController < ApplicationController
  #before_action :authenticate_user!
  #before_action :ensure_correct_user, only: [:edit, :update]
  #ensure 例外処理 投稿者だけが〜できる


  def show
    @user = User.find(params[:id])
     #@user = current_user #どっちがいいんだろう
    @post = Post.new
    @posts = @user.posts
    @posts_all = Post.all
    
    #@posts = @user.posts.page(params[:page])
    #kaminari pageメソッドで使用可能
  end

  def edit
    @user = User.find(params[:id]) #ensureの後で外す
     #@user = current_user #どっちがいいんだろう
  end

  def update
     #@user = current_user #どっちがいいんだろう
    @user = User.find(params[:id]) #ensureの後で外す
      if @user.update(user_params) #引数を指定しないとargumentエラー
        redirect_to user_path(@user), notice: "更新に成功しました"
      else
        render :edit
      end
  end

  def confirm 
  end

  def withdraw #退会処理　後ほど
    #@user = User.find(params[:id])
    #@user = User.find(user_params)
    #@user.update(is_user_status: false))
    #reset_session
    #flash[:notice] = "退会処理を実行しました。"
    #redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end
  
end
