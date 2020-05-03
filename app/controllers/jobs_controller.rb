class JobsController < ApplicationController
    
    def show
        @job = Job.find(params[:id])
    end

    def new
        @event = Event.find(params[:event_id])
        @user = current_user
        @job = Job.new
    end

    def create
        @event = Event.find(params[:event_id])
        @job = @event.jobs.build(job_params)
        if @job.save
            redirect_to event_job_path(@event, @job)
        else
            #errors?
            render 'new'
        end
    end

    private
    
    def job_params
        params.require(:job).permit(:title, :event_id, :user_id, :description, :assigned)
    end
end

#"job"=>{"title"=>"Worst Job Ever", "description"=>"Cleaning toilets after a big event", 
#"assigned"=>"0", "event_id"=>"", "user_id"=>""}