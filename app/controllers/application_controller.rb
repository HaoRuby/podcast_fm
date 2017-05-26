class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_filter :configure_permitted_paramters, if: :devise_controller?

  protected

  # config strong params for podcast's additional attributes 
  def configure_permitted_paramters
  	devise_parameter_sanitizer.permit(:sign_up) do |u|
  		u.permit( :email,
  							:password,
  							:password_confirmation,
  							:title)
  	end
  	
  	devise_parameter_sanitizer.permit(:account_update) do |u|
  		u.permit( :email,
  							:password,
  							:password_confirmation,
  							:current_password,
  							:title,
  							:description,
  							:itunes,
  							:stitcher,
  							:podbay)
  	end
  end
end
