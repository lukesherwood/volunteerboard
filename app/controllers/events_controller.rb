class EventsController < ApplicationController
    before_action :set_event, only: [:show, :edit, :update, :destroy]

    def index
        if params[:organisation_slug]
            @organisation = Organisation.find_by_slug(params[:organisation_slug])
            @events = @organisation.events
        else
            @events = Event.all
        end
    end

    def new
        @event = Event.new
        authorize @event
        @job = @event.jobs.build
    end

    def create
        @event = Event.new(event_params)
        authorize @event
        if @event.save
            redirect_to event_path(@event)
        else
            render 'new'
        end
    end

    def show
    end

    def edit
        authorize @event
    end

    def update
        authorize @event
        if @event.update(event_params)
            redirect_to event_path(@event)
        else
            render 'edit'
        end
    end

    def destroy
        authorize @event
        @event.destroy
        redirect_to events_path
    end

    private

    def event_params
        params.require(:event).permit(:organisation_id, :name, :date, :location, :information, jobs_attributes: [:id, :title, :event_id, :user_id, :description, :assigned, :work_type, :location, :commitment, :_destroy])
    end

    def set_event
        @event = Event.find(params[:id])
    end
end
