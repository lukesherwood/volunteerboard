class EventPolicy < ApplicationPolicy
  attr_reader :user, :event

  def initialize(user, event)
    @user = user
    @event = event
  end

  def new?
    user.present?
  end
  
  def create?
    return true if user = @event.organisation.owner
  end
  
  def edit?
    return true if user.present? && user == @event.organisation.owner
  end
 
  def update?
    return true if user.present? && user == @event.organisation.owner
  end
 
  def destroy?
    return true if user.present? && user == @event.organisation.owner
  end
 
end