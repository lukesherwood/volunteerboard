class Event < ApplicationRecord
  belongs_to :organisation #an organisation is holding the event
  has_many :jobs
  has_many :volunteers, through: :jobs, foreign_key: "user_id"
  
end

