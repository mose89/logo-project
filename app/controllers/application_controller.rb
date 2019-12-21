class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email, :password, :org_no, :address, :phone, :established, :industry_id, :referral])
  end

  def after_sign_in_path_for(resource)
    admins_dashboard_path #your path
  end

  def after_sign_out_path_for(resource)
    root_path #your path
  end

  include Pundit
  protect_from_forgery

  after_action :verify_authorized, except: :index, unless: :devise_controller?
  # after_action :verify_policy_scoped, only: :index, unless: :devise_controller?
end
