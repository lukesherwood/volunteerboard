class EventsController < ApplicationController
    before_action :set_event, only: [:show, :edit, :delete]
    
    def index
        @events = Event.all
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
        #should link to organisation/events
    end

    def edit
        if @event.update(event_params)
            redirect_to event_path(@event)
        else
            render 'new'
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
