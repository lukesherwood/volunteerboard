class Organisation < ApplicationRecord
    has_many :events 
    belongs_to :owner, class_name: "User" 
    has_many :volunteers, through: :events, foreign_key: "user_id"
    
    validates :name, :location,  presence: true
end

