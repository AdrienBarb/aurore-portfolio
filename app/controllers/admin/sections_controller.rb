class Admin::SectionsController < ApplicationController
  before_action :set_section, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:new, :create]

  def index
    @sections = Section.all
  end

  def show
  end

  def new
    @section = @user.sections.build
  end

  def create
    @section = @user.sections.build(section_params)
    if @section.save
      flash[:notice] = "La rubrique a bien été créé"
      redirect_to admin_sections_path
    else
      flash[:alert] = "Une erreur s'est produite"
      render :new
    end
  end

  def edit
  end

  def update
    if @section.update(section_params)
      flash[:notice] = "Vos modifictions ont bien été prisent en compte"
      redirect_to admin_section_path(@section)
    else
      flash[:alert] = "Vos modifictions n'ont pas pu être prisent en compte"
      render :edit
    end
  end

  def destroy
    @section.destroy
    redirect_to admin_sections_path
  end

  private

  def set_user
    @user = current_user
  end

  def set_section
    @section = Section.find(params[:id])
  end

  def section_params
    params.require(:section).permit(:title, :description, :link, images: [])
  end
end
