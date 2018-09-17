class WelcomeController < ApplicationController
  skip_before_action :verify_tenant_api_key

  def index

  end
end
