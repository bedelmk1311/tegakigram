# frozen_string_literal: true

class Admin::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

    # 新規登録時のエラーをフラッシュメッセージで返す どうしてもバリデーションエラー時にURLが/usersになってしまうため
  # redirect_toを使うことにします
  def create
    # build_resourceはRegistrationsControllerで使われるメソッド、新規登録処理をカスタマイズしたいときに使う
    # (sign_up_params)がform_withから送られてくる値
    build_resource(sign_up_params)

    # resource は Devise のコントローラーで使用されるユーザーのインスタンスで通常は @user として扱う
    if resource.save
      sign_up(resource_name, resource)
      redirect_to after_sign_up_path_for(resource)
    else
      # resource.errorsの中にモデルのバリデーションエラーが格納されてる
      # full_messagesでエラーを一覧表示に .join("<br>")で改行 .html_safeで<br>をRailsにHTMLとして扱わせる
      flash[:alert] = resource.errors.full_messages.join("<br>").html_safe
      redirect_to new_user_registration_path
    end
  end

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
