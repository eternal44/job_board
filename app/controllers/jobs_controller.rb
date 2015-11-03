class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  # before_action :authenticate_user!

  def index
    if current_user.role == 'Employer' || current_user.role == 'Worker'
      @q = current_user.jobs.ransack(params[:q])
      @jobs = @q.result(distinct: true).includes(:user)
    else
      redirect_to admin_dashboards_path
    end
  end

  def show
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    @job.user = current_user
    @job.status = 'Unconfirmed'

    if @job.save
      redirect_to :back
    else
      render action: :new
    end
  end

  def edit
  end

  def update
    if @job.update(job_params)
      redirect_to @job
    else
      render action: :edit
    end
  end

  def destroy
    @job.destroy
    redirect_to :back
  end

  def edit_multiple
    @jobs = Job.find(params[:job_ids])
  end

  def update_multiple
    @jobs = Job.find(params[:job_ids])
    @jobs.reject! do | job |
      job.update_attributes!(job_params.reject { |k,v| v.blank? })
    end
    if @jobs.empty?
      redirect_to admin_dashboards_path
    else
      @job = Job.new(params[:job])
      render "edit_multiple"
    end
  end

  private
  def job_params
    params.require(:job).permit(:subject,
                                :location,
                                :appointment_date_time,
                                :user_id,
                                :status,
                                :attendant_id,
                                :priority,
                                :overdue,
                                :number_of_workers,
                                :min_hours,
                                :max_hours,
                                :price_per_worker,
                                job_type_ids:[])
  end

  def set_job
    @job = Job.find(params[:id])
  end
end
