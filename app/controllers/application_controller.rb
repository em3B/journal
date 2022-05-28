class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end

  def after_sign_in_path_for(resource)
    subjects_path
  end

  def after_sign_up_path_for(resource)
    subjects_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[teacher username school_name])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[teacher username school_name])
  end
end
