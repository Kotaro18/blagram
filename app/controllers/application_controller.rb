class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # セキュリティ

  before_action :configure_permitted_parameters, if: :devise_controller?
  # メソッドはdevise＿controllerを使うときしか処理しない

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :username])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    end
end
