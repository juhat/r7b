class ApplicationController < ActionController::Base
  around_action :set_locale

  private

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
