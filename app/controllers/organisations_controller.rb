class OrganisationsController < ApplicationController
    before_action :set_organisation, only: [:show, :edit, :destroy, :update]

    def index
        @orgs = Organisation.all
    end

    def show
        @organisation = Organisation.find_by_slug(params[:slug])
    end

    def new
        @organisation = Organisation.new
        authorize @organisation
        
    end

    def create
        @organisation = Organisation.new(organisation_params)
        @organisation.owner = current_user
        current_user.organisation = @organisation
        if @organisation.save && current_user.save
            redirect_to organisation_path(@organisation.slug)
        else
            render 'new'
        end
    end

    def edit
        authorize @organisation
    end

    def update
        authorize @organisation
        if @organisation.update(organisation_params)
            redirect_to organisation_path(@organisation.slug)
        else
            render 'edit'
        end
    end

    def destroy
        authorize @organisation
        @organisation.destroy
        redirect_to organisations_path
    end

    private

    def set_organisation
        @organisation = Organisation.find_by_slug(params[:slug])
    end

    def organisation_params
        params.require(:organisation).permit(:name, :location, :mission, :category, :website, :contact_info)
    end
end
