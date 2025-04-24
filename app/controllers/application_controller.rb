class ApplicationController < ActionController::Base
  before_action :authenticate_user!, unless: :admin_controller?
  #before_action :authenticate_user!, except: [:top,:about] 上に修正
  #全てのコントローラーでユーザー認証するが、adminコントローラーでは除外する

  skip_before_action :authenticate_user!, only: [:top, :about]
  #ログイン認証をスキップ

  before_action :configure_permitted_parameters, if: :devise_controller?
  #deviseの機能が使われる前に、configure_permitted_parametersをする

  def after_sign_in_path_for(resource)
    posts_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  protected #呼び出された他のコントローラからも参照できる
  #sign_upの際に、nameのデータ操作を許可
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def back_redirect_by_notice(message) #ページの再読み込みしてフラッシュメッセを出す
    redirect_to request.referer, notice: message
  end

  private
  #コントローラーが"admin/"で始まるパスかどうかを判定
  def admin_controller?
    controller_path.starts_with?('admin/')
  end
end
