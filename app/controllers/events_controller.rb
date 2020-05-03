class EventsController < ApplicationController
    
    def index
        @organisation = Organisation.find(params[:id])
        @events = Event.all
    end

    def new
        @event = Event.new
        @organisation = Organisation.find(params[:organisation_id])
    end

    def create
        @organisation = Organisation.find(params[:organisation_id])
        @event = @organisation.events.build(event_params)
        if @event.save
            redirect_to organisation_event_path(@organisation, @event)
        else
            #errors?
            render 'new'
        end
    end

    def show
        #should link to organisation/events
        @event = Event.find(params[:id])
    end
    private

    def event_params
        params.require(:event).permit(:name, :date, :location, :information)
    end
end

#{"event"=>{"organisation_id"=>"1", "name"=>"Sunday brunch with boho beats", 
#"date"=>"26/04/20 11:00", 
#"location"=>"Jukebox, Cleveland City", 
#"information"=>"Come peace out on a chill sunday morning."}