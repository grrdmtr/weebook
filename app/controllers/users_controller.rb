class UsersController < ApplicationController
  def index
    @users = User.all.order('created_at DESC')
    @user = current_user
  end

  def edit

  end

  def show
    @user = User.find(params[:id])
  end
end
