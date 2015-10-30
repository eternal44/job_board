class UsersController < ApplicationController
  def index
    @users = User.all.where(role: 'Worker')
  end
end
