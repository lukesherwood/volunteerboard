class JobPolicy < ApplicationPolicy
    attr_reader :user, :job

    def initialize(user, job)
    @user = user
    @job = job
    @organisation = @job.organisation
    end

    def new?
    return true if user.present? && user == @organisation.owner
    end

    def create?
    return true if user == @organisation.owner
    end

    def edit?
    return true if user.present? && user == @organisation.owner
    end

    def update?
    return true if user.present? 
    end

    def destroy?
    return true if user.present? && user == @organisation.owner
    end

end