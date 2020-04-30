class Organisation < ApplicationRecord
    has_many :events
    has_many :users, through: :events
    belongs_to :user
end

