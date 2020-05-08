class OrganisationPolicy < ApplicationPolicy
  attr_reader :user, :organisation

  def initialize(user, organisation)
    @user = user
    @organisation = organisation
  end

  def update?
    return true if @user == @organisation.owner
  end

  def new?
    @user.present?
  end
  
  def edit?
    return true if user.present? && @user == @organisation.owner
  end

  def create?
    user.present?
  end
 
  def destroy?
    return true if user.present? && user == @organisation.owner
  end

end