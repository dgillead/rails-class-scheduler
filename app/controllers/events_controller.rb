class EventsController < ApplicationController
  before_action :find_studio, only: [:new, :create]

  def new
    @event = Event.new
  end

  def create
    @event = @studio.events.new(event_parameters)
    if @event.save
      redirect_to studio_event_path(@studio, @event)
    else
      render :new
    end
  end
  

  private

  def find_studio
    @studio = Studio.find_by(id: params[:studio_id])
  end

  def event_parameters
    params.require(:event).permit(:title, :description, :starts_at, :ends_at, :max_participants)
  end
end