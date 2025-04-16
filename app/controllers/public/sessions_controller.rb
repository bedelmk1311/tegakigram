# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create] #構成する
  #before_action :block_public_user, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # どこかに書くのか？
  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  #applicationコントローラーと重複
  #def after_sign_in_path_for(resource) #ログイン後 
    #posts_path
  #end

  #def after_sign_out_path_for(resource) #ログアウト後
    #root_path
  #end

  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to posts_path, notice: "ゲストユーザーでログインしました"
  end

  # def block_public_user
  #   @user = User.find_by(email: params[:user][:email])
  #   if @user.valid_password?(params[:user][:password])
  #   elsif
  #     flash[:error] = "パスワードが間違っています"
  #     redirect_to new_user_session_path
  #   else
  #     flash[:error] = "該当するユーザーが見つかりません"
  #     redirect_to new_user_session_path
  #   end
  # end

  #private #あとで
  #def block_if_admin_signed_in
    #if admin_signed_in?
      #flash[:alert] = "管理者としてログイン中は顧客ログインできません"
      #redirect_to admin_root_path
    #end
  #end
end
