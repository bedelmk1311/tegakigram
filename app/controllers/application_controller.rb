class ApplicationController < ActionController::Base
  #before_action :authenticate_user!, except: [:top]

  #ログイン認証が成功していないと、許可以外の画面は表示できない仕様
  #あとでコメントアウト戻す
  before_action :configure_permitted_parameters, if: :devise_controller?
  #deviseの機能が使われる前に、configure_permitted_parametersをする

  def after_sign_in_path_for(resource)
    posts_path #ログイン後の遷移先
  end

  def after_sign_out_path_for(resource)
    root_path #ログアウト後は最初に戻る
  end

  protected #呼び出された他のコントローラからも参照できる
  #なんだっけ？いるっけ？
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  #deviseの機能が使われる前に、configure_permitted_parametersをする

  end
end
