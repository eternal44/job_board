class AdminDashboardsController < ApplicationController
  def index
    if current_user.role == 'Attendant'
      @q = Job.all.where(attendant_id: current_user.id).ransack(params[:q])
    elsif current_user.role == 'Admin'
      @q = Job.all.ransack(params[:q])
    else
      redirect_to root_url
    end
      # extract to model later
      @jobs_pending = @q.result.includes(:user).where(status: 'Pending')
      @jobs_approved = @q.result.includes(:user).where(status: 'Approved')
      @jobs_open = @q.result.includes(:user).where(status: 'Open')
      @jobs_finished = @q.result.includes(:user).where(status: 'Finished')
      @jobs_closed = @q.result.includes(:user).where(status: 'Closed')
      @jobs = Job.all
  end
end

