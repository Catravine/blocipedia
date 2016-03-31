class ApplicationController < ActionController::Base
  include Pundit
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # default: redirect to login page if not signed in
  before_action :authenticate_user!

  # How to handle various errors
  rescue_from ActiveRecord::RecordNotFound, with: :handle_error

  # How to handle user doing unauthorized actions
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  helper_method :resource, :resource_name, :devise_mapping

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end

  def handle_error
    redirect_to root_url
  end

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to view this wiki."
    redirect_to wikis_path
  end
end
