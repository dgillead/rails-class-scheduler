class EventParticipantsController < ApplicationController

  def new
    @event_participant = EventParticipant.new
    @events = Event.all
  end

  def create
    @event_participant = EventParticipant.new(event_participant_params)
    @event_participant['user_name'] = current_user.first_name
    if @event_participant.save
      redirect_to @event_participant
    else
      render :new
    end
  end

  def show
  end

  private

  def event_participant_params
    params.require(:event_participant).permit(:event_id, :course)
  end
end
