class PagesController < ApplicationController
  def home
    @user = User.find(1)
    @projects = @user.projects.order(created_at: :asc)
  end
end
