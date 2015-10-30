class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  # before_action :authenticate_user!

  def index
    @q = current_user.jobs.ransack(params[:q])
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

  def approve
    Job.where(id: params[:job_ids]).update_all( status: 'Approved' )
    redirect_to jobs_url
  end

  private
  def job_params
    params.require(:job).permit(:title,
                                :location,
                                :first_start_time_choice,
                                :second_start_time_choice,
                                :user_id,
                                :status,
                                job_type_ids:[])
  end

  def set_job
    @job = Job.find(params[:id])
  end
end
