class WelcomeController < ApplicationController
    
    def home
        @events = Event.last(5)
    end
end