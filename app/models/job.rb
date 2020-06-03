class Job < ApplicationRecord
    belongs_to :event, optional:true
    belongs_to :volunteer, optional:true, class_name: "User", foreign_key: "user_id"
    validates :title, presence: true
    validates :description, presence: true
    validates :work_type, presence: true
    validates :commitment, presence: true
    validates :volunteer, presence: { message: "must be provided if job is assigned" }, if: -> { assigned } 
    validates :volunteer, absence: { message: "must be blank if job is un-assigned" }, if: -> { !assigned } 
    scope :available, -> { where(assigned: false)}

    def organisation
        self.event.organisation
    end

    def organisation=(organisation)
        self.event.organisation = organisation
    end

end
