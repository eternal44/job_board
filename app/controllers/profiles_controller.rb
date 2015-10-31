class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy, :upvote, :downvote]

  def show
  end

  def update
    if @profile.update(profile_params)
      redirect_to @profile
    else
      render :edit
    end
  end

  def upvote
    @profile.upvote_by current_user
    redirect_to profile_path
  end

  def downvote
    @profile.downvote_by current_user
    redirect_to profile_path
  end

  private
    def profile_params
      params.require(:profile).permit(:name, :phone_number)
    end

    def set_profile
      @profile = Profile.find(params[:id])
    end
end
