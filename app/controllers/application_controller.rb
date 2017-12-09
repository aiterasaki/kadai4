class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  # ログインしてないユーザーをログイン画面に戻すヘルパーメソッド（deviseに導入されてる機能）
  before_action :configure_permitted_parameters,if: :devise_controller?
  def index
    @users = User.all
  end

  private
  def configure_permitted_parameters
  	# 必要な情報以外を弾いて、また必要な情報がなかったらオッケー出さないやつ
  	devise_parameter_sanitizer.permit(:sign_up,keys:[:nickname])
  end

end
