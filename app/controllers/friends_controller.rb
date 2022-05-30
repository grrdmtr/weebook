class FriendsController < ApplicationController
  before_action :set_friend, only: :destroy

  def index
    @friends = current_user.friends
  end

  def create
    @friend = current_user.friends.build(params[:friend_id])
    if @friend.save
      # figure out why it is not redirecting
      flash[:notice] = "Friend was successfully added."
      redirect_back fallback_location: root_path
    else
      flash[:error] = "Unable to add friend."
      render :json => @friend.errors, :status => :unprocessable_entity
    end
  end

  def destroy
    current_user.remove_friend(@friend)
    head :no_content
  end
  ...
  private

  def set_friend
    @friend = current_user.friends.find(params[:id])
  end

  def friend_params
    params.require(:friend).permit(:friend_id)
  end
end
