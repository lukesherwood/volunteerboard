class Job < ApplicationRecord
    belongs_to :event, optional:true
    belongs_to :volunteer, optional:true, class_name: "User", foreign_key: "user_id"

    validates :title, :description, presence: true
end
