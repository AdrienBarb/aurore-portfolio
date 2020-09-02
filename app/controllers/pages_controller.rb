class PagesController < ApplicationController
  def home
    @user = User.find(1)
  end
end
