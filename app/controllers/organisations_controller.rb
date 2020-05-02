class OrganisationsController < ApplicationController

    def index
        @orgs = Organisation.all
    end
end
