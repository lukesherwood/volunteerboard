class Job < ApplicationRecord
    belongs_to :event, optional:true
    belongs_to :volunteer, optional:true, class_name: "User", foreign_key: "user_id"

    validates :title, :description, presence: true

    def organisation
        self.event.organisation
    end

    def organisation=(organisation)
        self.event.organisation = organisation
    end

end
