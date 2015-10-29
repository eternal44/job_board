class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  # before_action :authenticate_user!

  def index
    @q = Job.ransack(params[:q])
    @jobs = @q.result(distinct: true).includes(:user)
  end

  def show
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    @job.user = current_user
    @job.status = 'Created'

    if @job.save
      redirect_to jobs_path
    else
      render action: :new
    end
  end

  def edit
  end

  def update
    if @job.update(job_params)
      redirect_to jobs_path
    else
      render action: :edit
    end
  end

  def destroy
    @job.destroy
    redirect_to jobs_path
  end

  def edit_multiple
    @jobs = Job.find(params[:job_ids])
  end

  def update_multiple
    @jobs = Job.find(params[:job_ids])
    @jobs.reject! do | job |
      job.update_attributes(params[:job].reject { |k,v| v.blank? })
    end
    if @jobs.empty?
      redirect_to jobs_url
    else
      @job = Job.new(params[:job])
      render "edit_multiple"
    end
  end

  private
  def job_params
    params.require(:job).permit(:job, :title, :location, :start_time, :end_time,
                                :user_id, :status)
  end

  def set_job
    @job = Job.find(params[:id])
  end
end
