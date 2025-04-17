class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update,:destroy, :index_favorite]
  before_action :ensure_guest_user, only: [:edit]
  #ensure 例外処理 投稿者だけが〜できる

  def show
    @user = User.find(params[:id])
    @post = Post.new
    @posts = @user.posts
    @posts_all = Post.all

    #@posts = @user.posts.page(params[:page])
    #kaminari pageメソッドで使用可能
  end

  def edit
  end

  # def index_favorite 下のに修正
    # @posts_favorite = Post.where(favorites: { user_id: current_user.id })
    # ユーザーがいいねしたレコードを絞り込み
  # end
  def index_favorite 
    @posts_favorite = current_user.favorites.map(&:post)
    #ユーザーが持ついいねのデータをpostメソッドを適用にして表示　
  end

  def index_follow
    #@posts_follow = current_user.followings.map(&:post)
  end

  def update
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

  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.email == "guest@example.com"
      redirect_to user_path(current_user) , notice: "ゲストユーザーはプロフィール編集画面へ遷移できません"
    end
  end
end
