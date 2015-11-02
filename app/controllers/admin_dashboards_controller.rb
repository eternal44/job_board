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
      @jobs_unconfirmed = @q.result.includes(:user).where(status: 'Unconfirmed')
      @jobs_confirmed = @q.result.includes(:user).where(status: 'Confirmed')
      @jobs_dispatched = @q.result.includes(:user).where(status: 'Dispatched')
      @jobs = Job.all
  end
end

