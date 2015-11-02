class AdminDashboardsController < ApplicationController
  def index
    if current_user.role == 'Attendant'
      # extract to model later
      job_scope = Job.all.where(attendant_id: current_user.id)
      @jobs_pending = job_scope.where(status: 'Pending')
      @jobs_approved = job_scope.where(status: 'Approved')
      @jobs_open = job_scope.where(status: 'Open')
      @jobs_finished = job_scope.where(status: 'Finished')
      @jobs_closed = job_scope.where(status: 'Closed')
    elsif current_user.role == 'Admin'
      @jobs = Job.all
    else
      redirect_to root_url
    end
  end
end

