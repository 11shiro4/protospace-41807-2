class ApplicationController < ActionController::Base
  before_action :authenticate_user!#ログインしていないユーザーをログインページの画面に促す#ok
  before_action :configure_permitted_parameters, if: :devise_controller?  # Deviseのストロングパラメータ設定

  
  private

  # Deviseでストロングパラメータを追加
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :profile, :occupation, :position])
  end
end