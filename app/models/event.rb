class Event < ApplicationRecord
  has_many :event_participants
  belongs_to :studio
end
