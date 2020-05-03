class OrganisationsController < ApplicationController

    def index
        @orgs = Organisation.all
    end

    def show
        @organisation = Organisation.find(params[:id])
    end
end
