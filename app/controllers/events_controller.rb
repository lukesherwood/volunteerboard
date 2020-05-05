class EventsController < ApplicationController
    before_action :set_event, only: [:show, :edit, :update, :delete]

    def index
        if params[:organisation_slug]
            @events = Organisation.find_by_slug(params[:organisation_slug]).events
        else
            @events = Event.all
        end
    end

    def new
        @event = Event.new
    end

    def create
        @event = Event.new(event_params)
        if @event.save
            redirect_to event_path(@event)
        else
            render 'new'
        end
    end

    def show
    end

    def edit
    end

    def update
        if @event.update(event_params)
            redirect_to event_path(@event)
        else
            render 'edit'
        end
    end

    private

    def event_params
        params.require(:event).permit(:organisation_id, :name, :date, :location, :information)
    end

    def set_event
        @event = Event.find(params[:id])
    end
end
