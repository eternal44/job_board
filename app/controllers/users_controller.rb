class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]

  def index
    @users = User.all
  end

  def edit

  end

  def update
    if @user.update(user_params)
      redirect_to users_path
    else
      render :edit
    end
  end

    private
    def user_params
      params.require(:user).permit(:role)
    end
    def set_user
      @user = User.find(params[:id])
    end
end
