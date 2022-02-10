class ApplicationController < ActionController::Base
  include Pagy::Backend
  before_action :set_locale

  private
  def set_locale
      if %w(ja en).include?(params[:locale])
      I18n.locale = params[:locale]
      else
        I18n.locale = "ja"
      end
  end
end
