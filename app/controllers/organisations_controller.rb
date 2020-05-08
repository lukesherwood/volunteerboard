class OrganisationsController < ApplicationController
    before_action :set_organisation, only: [:show, :edit, :delete, :update]

    def index
        @orgs = Organisation.all
    end

    def show
        @organisation = Organisation.find_by_slug(params[:slug])
    end

    def new
        @organisation = Organisation.new
    end

    def create
        @organisation = Organisation.new(organisation_params)
        @organisation.owner = current_user
        if @organisation.save
            redirect_to organisation_path(@organisation.slug)
        else
            render 'new'
        end
    end

    def edit
    end

    def update
        authorize @organisation
        if @organisation.update(organisation_params)
            redirect_to organisation_path(@organisation.slug)
        else
            render 'edit'
        end
    end

    def delete

    end

    private

    def set_organisation
        @organisation = Organisation.find_by_slug(params[:slug])
    end

    def organisation_params
        params.require(:organisation).permit(:name, :location, :mission)
    end
end
