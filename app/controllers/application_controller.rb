require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder

  layout :layout_by_controller

  respond_to :html
  responders :flash

  protect_from_forgery

  before_filter :set_locale

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options={})
    logger.debug "default_url_options is passed options: #{options.inspect}\n"
    { :locale => I18n.locale }
  end

  private

  # Define a method that can check which controller is calling
  # and render the correct layout:
  #
  # devise_controller ? 'logged' : 'application'
  def layout_by_controller
    if devise_controller? || controller_name == 'login'
      'application'
    else
      'logged'
    end
  end
end
