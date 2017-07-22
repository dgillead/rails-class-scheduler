class EventsController < ApplicationController
  before_action :find_studio, only: [:new, :create, :show, :index, :edit, :update, :destroy]
  before_action :find_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = @studio.events.all
  end

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

  def show
    participants = find_participants
    render :show, locals: { participants: participants }
  end

  def edit
  end

  def update
    if @event.update_attributes(event_parameters)
      redirect_to studio_event_path(@studio, @event)
    else
      render :edit, locals: { studio: @sturdion, event: @event }
    end
  end

  def destroy
    @event.destroy
    redirect_to studio_events_path(@studio)
  end

  private

  def find_event
    @event = Event.find_by(id: params[:id])
  end

  def find_studio
    @studio = Studio.find_by(id: params[:studio_id])
  end

  def find_participants
    all_participants = EventParticipant.all
    current_participants = all_participants.where("event_id = #{@event.id}")
    # binding.pry
  end

  def event_parameters
    params.require(:event).permit(:title, :description, :starts_at, :ends_at, :max_participants)
  end
end
