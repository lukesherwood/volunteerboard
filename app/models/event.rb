class Event < ApplicationRecord
  belongs_to :organisation #an organisation is holding the event
  has_many :jobs
  has_many :volunteers, through: :jobs, foreign_key: "user_id"
  accepts_nested_attributes_for :jobs, reject_if: proc { |attributes| attributes['title'].blank? }
  
  validates :name, presence: true
  validates :date, presence: true
  validates :location,  presence: true

  def datetime
    self.date.strftime("%m:%M %p, %A %e %B, %Y")
  end
end

