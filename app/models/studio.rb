class Studio < ApplicationRecord
  has_many :events, dependent: :destroy
  belongs_to :user
end
