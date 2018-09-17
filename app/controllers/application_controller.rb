class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :verify_tenant_api_key, if: "request.format.html?"

  def verify_tenant_api_key
    if session[:tenant_api_key].present? && params[:api_key].present? && session[:tenant_api_key] == params[:api_key]
      tenant = Tenant.find_by(api_key: session[:tenant_api_key])
      tenant.add_views_count if tenant.present?
      @hash_of_additional_params = {api_key: session[:tenant_api_key]} # Will be used on `url_for` ApplicationHelper
    else
      session[:tenant_api_key] = nil
      redirect_to login_path
    end
  end
end
