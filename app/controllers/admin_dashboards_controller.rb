class AdminDashboardsController < ApplicationController
  def index
    if current_user.role == 'Attendant'
      @jobs_pending = Job.all.where(attendant_id: current_user.id, status: 'Pending')
      @jobs_approved = Job.all.where(attendant_id: current_user.id, status: 'Approved')
      @jobs_open = Job.all.where(attendant_id: current_user.id, status: 'Open')
      @jobs_finished = Job.all.where(attendant_id: current_user.id, status: 'Finished')
      @jobs_closed = Job.all.where(attendant_id: current_user.id, status: 'Closed')
    elsif current_user.role == 'Admin'
      @jobs = Job.all
    else
      redirect_to root_url
    end
  end
end

