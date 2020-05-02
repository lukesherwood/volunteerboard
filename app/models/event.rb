class Event < ApplicationRecord
  belongs_to :organisation #an organisation is holding the event
  has_many :jobs
  has_many :volunteers, through: :jobs, foreign_key: "user_id"
  
  validates :name, :date, :location,  presence: true

  def datetime
    self.date.strftime("%l:%M %p %A %m %b %Y")
  end
end

