class OrganisationsController < ApplicationController
    before_action :set_organisation, only: [:show]
    def index
        @orgs = Organisation.all
    end

    def show
        @organisation = Organisation.find_by_slug(params[:slug])
    end

    private

    def set_organisation
        @organisation = Organisation.find_by_slug(params[:slug])
    end
end
