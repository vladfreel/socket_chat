class ApplicationController < ActionController::Base
  # include Pundit
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  # before_action :configure_permitted_parameters, if: :devise_controller?
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  #
  # protected
  #
  # def configure_permitted_parameters
  #   # devise_parameter_sanitizer.permit(:sign_in, keys: %i[email password remember_me])
  #   added_attrs = %i[password password_confirmation remember_me avatar]
  #   devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
  #   devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  # end
  #
  # private
  #
  # def user_not_authorized
  #   flash[:warning] = 'You are not authorized to perform this action.'
  #   redirect_to(request.referrer || root_path)
  # end
end
