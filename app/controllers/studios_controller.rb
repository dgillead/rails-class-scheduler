class StudiosController < ApplicationController
  before_action :find_user, only: [:create]

  def new
    @studio = Studio.new
  end

  def create
    @studio = Studio.new(studio_params)
    @studio['user_id'] = current_user.id
    binding.pry
    @studio.save!
  end

  private

  def find_user
    @user = User.find_by(id: params[:id])
  end

  def studio_params
    params.require(:studio).permit(:name, :description, :address)
  end
end
