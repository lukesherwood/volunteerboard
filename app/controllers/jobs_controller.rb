class JobsController < ApplicationController
    before_action :set_job, only: [:show, :edit, :update, :destroy]
    before_action :set_event, only: [:create, :new, :edit, :update]

    def show
        @organisation = @job.organisation
    end

    def new
        @job = Job.new
    end

    def index
        if params[:organisation_slug]
            @organisation = Organisation.find_by_slug(params[:organisation_slug])
            @jobs = @organisation.jobs
        elsif params[:event_id]
            @event = Event.find(params[:event_id])
            @jobs = @event.jobs
        else
            @jobs = Job.all
        end
    end

    def create
        @job = @event.jobs.build(job_params)
        if @job.save
            redirect_to event_job_path(@event, @job)
        else
            render 'new'
        end
    end

    def edit
    end

    def update
        if @job.update(job_params)
            redirect_to event_job_path(@event, @job)
        else
            render 'edit'
        end
    end

    def destroy
        @job.destroy
        redirect_to event_jobs_path
    end

    private
    
    def set_job
        @job = Job.find(params[:id])
    end

    def set_event
        @event = Event.find(params[:event_id])
    end

    def job_params
        params.require(:job).permit(:title, :event_id, :user_id, :description, :assigned)
    end
end
