class StudiosController < ApplicationController
  before_action :find_user, only: [:create]
  before_action :find_studio, only: [:show, :edit, :update, :destroy]

  def index
    @studios = Studio.all
  end

  def new
    @studio = Studio.new
  end

  def create
    @studio = current_user.studios.new(studio_params)
    if @studio.save
      redirect_to @studio
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def destroy
    @studio.destroy
    redirect_to '/studios'
  end

  def update
    if @studio.update_attributes(studio_params)
      redirect_to @studio
    else
      render :edit
    end
  end

  private

  def find_studio
    @studio = Studio.find_by(id: params[:id])
  end

  def find_user
    @user = User.find_by(id: params[:id])
  end

  def studio_params
    params.require(:studio).permit(:name, :description, :address)
  end
end
