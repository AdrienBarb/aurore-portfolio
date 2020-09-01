class Admin::ApplicationController < ApplicationController
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    @user = User.find(1)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :phone_number, :title, :description])
  end
end
