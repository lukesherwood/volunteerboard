class JobsController < ApplicationController
    before_action :set_job, only: [:show, :edit, :update, :destroy]
    before_action :set_event, only: [:show, :create, :new, :edit, :update]
    
    def show
        @organisation = @job.organisation
    end

    def new
        @job = @event.jobs.build
        authorize @job
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

    def index_available
        if params[:organisation_slug]
            @organisation = Organisation.find_by_slug(params[:organisation_slug])
            @jobs = @organisation.jobs.available
        elsif params[:event_id]
            @event = Event.find(params[:event_id])
            @jobs = @event.jobs.available
        else
            @jobs = Job.available
        end
        render 'index'
    end

    def create
        @job = @event.jobs.build(job_params)
        authorize @job
        if @job.save
            redirect_to event_path(@event)
        else
            render 'new'
        end
    end

    def edit
        authorize @job
    end

    def update
        authorize @job
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
        params.require(:job).permit(:title, :event_id, :user_id, :description, :assigned, :work_type, :location, :commitment)
    end
end
