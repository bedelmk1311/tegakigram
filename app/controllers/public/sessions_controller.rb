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

  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to posts_path, notice: "ゲストユーザーでログインしました"
  end
end
