class EventPolicy < ApplicationPolicy
    attr_reader :user, :event

    def initialize(user, event)
      @user = user
      @event = event
    end

    def update?
      if @user == @event.organisation.owner
    end
end