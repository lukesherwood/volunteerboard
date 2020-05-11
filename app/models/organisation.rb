class Organisation < ApplicationRecord
    has_many :events 
    belongs_to :owner, class_name: "User" 
    has_many :volunteers, through: :events, foreign_key: "user_id"
    has_many :jobs, through: :events
    validates :name, presence: true
    validates :location, presence: true
    validates :category, presence: true

    def slug
        self.name.downcase.strip.gsub(' ', '-')
    end

    def self.find_by_slug(slug)
        self.all.find{|object| object.slug == slug}
    end
end

