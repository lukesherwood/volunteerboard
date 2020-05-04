class EventsController < ApplicationController
    before_action :set_event, only: [:show, :edit, :update, :delete]

    def index
        if params[:organisation_slug]
            organisation = Organisation.find_by_slug(params[:organisation_slug])
            @events = Event.all.find_all{|event| event.organisation_id == organisation.id}
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
        #should link to organisation/events
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
