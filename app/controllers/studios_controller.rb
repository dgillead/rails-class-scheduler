class StudiosController < ApplicationController
  before_action :find_user, only: [:create]
  before_action :find_studio, only: [:show]

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

  def index
    @studios = Studio.all
  end

  def show
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
