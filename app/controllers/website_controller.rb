class WebsiteController < ApplicationController
  skip_before_action :verify_tenant_api_key, only: [:login, :submit_login, :logout]
  before_action :all_data, except: [:login, :submit_login, :logout]

  def login
    return redirect_to root_path if session[:tenant_api_key].present?
  end

  def submit_login
    if (@tenant = Tenant.find_or_create_by(name: tenant_params[:name]))
      session[:tenant_api_key] = @tenant.api_key
      redirect_to root_path(api_key: session[:tenant_api_key])
    else
      render :login
    end
  end

  def logout
    session[:tenant_api_key] = nil
    redirect_to login_path
  end

  def index
    @chart_values = {}
    @chart_values["Total Questions"] = @public_questions.length
    @chart_values["Total Answers"] = @public_answers.length
    @chart_values["Total Users"] = @users.length
    @chart_values["All Tenant Views"] = @all_tenant_views
  end

  private

  def tenant_params
    params.require(:tenant).permit(:name)
  end

  def all_data
    @public_questions = Question.not_private
    @public_answers = Answer.from_public_questions
    @users = User.all
    @all_tenant_views = Tenant.all_tenant_views
  end
end
