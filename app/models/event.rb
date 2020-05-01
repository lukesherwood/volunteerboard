class Event < ApplicationRecord
  belongs_to :organisation #an organisation is holding the event
  has_many :jobs
  has_many :volunteers, through: :jobs, foreign_key: "user_id"
  #belongs_to :user #a user created the event (**thru an organisation?)
  #has_many :volunteers, through: :jobs #an event has many volunteers that are at the event
end

