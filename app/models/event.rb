class Event < ApplicationRecord
  belongs_to :organisation
  belongs_to :user
  has_many :users
end
