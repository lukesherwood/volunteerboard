class JobsController < ApplicationController
    
    def show
        @job = Job.find(params[:id])
    end

    def new
        @job = Job.new
        @event = Event.find(params[:event_id])
    end

    def index
        if params[:event_id]
            @event = Event.find(params[:event_id])
            @jobs = @event.jobs
        else
            @jobs = Job.all
        end
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
