class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    has_many :events #a organiser has created many events (**thru organisations?)
    has_many :organisations, through: :events #the events are run buy organisations that the organiser perhaps belongs to
    
end
