class Admin::ProjectsController < ApplicationController
  before_action :set_user, only: [:index, :new, :create, :edit, :update, :destroy]
  before_action :set_project, only: [:edit, :update, :destroy]

  def index
    @projects = Project.all
  end

  def new
    @project = @user.projects.build
  end

  def create
    @project = @user.projects.build(project_params)
    if @project.save
      flash[:notice] = "Le projets a bien été crée"
      redirect_to admin_user_projects_path
    else
      flash[:alert] = "Une erreur s'est produite. Le projet n'a pas pu être crée !"
      render :new
    end
  end

  def edit
  end

  def update
    if @project.update(project_params)
      flash[:notice] = "Le projets a bien été modifié"
      redirect_to admin_user_projects_path
    else
      flash[:alert] = "Une erreur s'est produite. Le projet n'a pas pu être modifié !"
      render :edit
    end
  end

  def destroy
    @project.destroy
    flash[:notice] = "Le projet a bien été supprimé"
    redirect_to admin_user_projects_path
  end

  private

  def set_user
    @user = current_user
  end

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title, :description)
  end
end
