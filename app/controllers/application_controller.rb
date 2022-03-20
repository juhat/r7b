class ApplicationController < ActionController::Base
  around_action :set_locale
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :terms_accepted])
  end

  def set_locale(&action)
    if params[:lang] && I18n.available_locales.include?(params[:lang].to_sym)
      locale = params[:lang]
      session[:lang] = locale
    else
      locale = session[:lang] || I18n.default_locale
    end
    I18n.with_locale(locale, &action)
  end
end
