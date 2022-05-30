class UsersController < ApplicationController
  def index
    @users = User.all.order('created_at DESC')
    @user = current_user
  end
end
