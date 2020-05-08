class OrganisationPolicy < ApplicationPolicy
    attr_reader :user, :organisation

    def initialize(user, organisation)
      @user = user
      @organisation = organisation
    end

    def update?
        raise params.inspect
      if @user == @organisation.owner
    end
end