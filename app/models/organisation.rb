class Organisation < ApplicationRecord
    has_many :events #organistions hold events
    belongs_to :owner, class_name: "User" #an organisation was created by an owner
    #has_many :volunteers, through: :events #organisations have members that are joined through events
    
end

