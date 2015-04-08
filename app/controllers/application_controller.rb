class ApplicationController < ActionController::Base
  before_action :authenticate_user!
	before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  def configure_permitted_parameters
  	# Config more field to devise 
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(  :email, :name , :about, :password, :password_confirmation, :remember_me, :role_id ) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(  :email, :name, :about, :password, :password_confirmation, :current_password, :role_id ) }
	end
end
