class Admin::UsersController < Admin::ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "Vos informations ont bien été modifiées"
      redirect_to admin_user_path(@user)
    else
      flash[:alert] = "Vos informations n'ont pas été modifiées"
      render :edit
    end
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :phone_number, :title, :description, :url_linkedin, :url_instagram, :url_facebook, :works_description, :photo)
  end

end
