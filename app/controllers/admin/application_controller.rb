class Admin::ApplicationController < ApplicationController
  before_action :authorize_admin!

  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    @user = User.find(1)
  end

  protected

  def authorize_admin!
    authenticate_user!
    unless current_user.admin?
      redirect_to root_path, alert: "You must be an admin to do that."
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :phone_number, :title, :description])
  end
end
