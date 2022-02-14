class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    # before_action :set_locale
    include Pagy::Backend
    protect_from_forgery with: :exception

     before_action :configure_permitted_parameters, if: :devise_controller?

     protected

          def configure_permitted_parameters
               devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:role, :email, :password, :password_confirmation)}

               devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:role, :email, :password, :current_password)}
          end
  

  private
  # def set_locale
  #     if %w(ja en).include?(params[:locale])
  #     I18n.locale = params[:locale]
  #     else
  #       I18n.locale = "ja"
  #     end
  # end
end
