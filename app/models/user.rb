class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    has_many :events #a organiser has created many events (**thru organisations?)
    has_many :organisations, through: :events #volunteers have many organisations that they are a part of
    belongs_to :event # a volunteer is a member of an event
    has_one :organisation #an organisation held the event
end
