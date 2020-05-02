class EventsController < ApplicationController
    
    def index
        @events = Event.all
    end

    def new
        @event = Event.new
        @organisation = current_user.organisation.id
    end

    def create
        @event = Event.new(event_params)
        if @event.save
            redirect_to event_path(@event)
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
        params.require(:event).permit(:organisation_id, :name, :date, :location, :information)
    end
end

#{"event"=>{"organisation_id"=>"1", "name"=>"Sunday brunch with boho beats", 
#"date"=>"26/04/20 11:00", 
#"location"=>"Jukebox, Cleveland City", 
#"information"=>"Come peace out on a chill sunday morning."}