class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update,:destroy]
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
        redirect_to user_path(@user), notice: "プロフィールの編集内容は保存されました"
      else
        render :edit
      end
  end

  def confirm 
    @user = current_user 
    #確認画面にいるuserを拾う
  end

  def destroy
    @user.destroy
    redirect_to root_path , notice: "アカウント削除に成功しました"
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
