class FriendRequestsController < ApplicationController
  def index
    @incoming = FriendRequest.where(friend: current_user)
    @outgoing = current_user.friend_requests
  end

  def new
    @friend_request = FriendRequest.new
  end

  def create
    @friend_request = current_user.friend_requests.build(friend_request_params)

    if @friend_request.save
      flash[:notice] = 'Friend request sent'
      redirect_to root_path
    else
      flash[:notice] = 'Something went wrong'
      redirect_to root_path
    end
  end

  def update
    @friend_request.accept
    head :no_content
  end

  def accept
    friend = User.find(params[:id])
    current_user.friends << friend
    flash[:notice] = "Friend request accepted"
    redirect_back fallback_location: root_path
    destroy
  end

  def reject
    flash[:alert] = "Friend request rejected"
    redirect_back fallback_location: root_path
    destroy
  end

  def destroy
    @friend_request = FriendRequest.where(friend_request_params)
    @friend_request.destroy_all
    flash[:notice] = "The friend request was canceled."
    redirect_to root_url
  end

  def delete
    @friend_request = FriendRequest.find(params[:id])
    @friend_request.destroy
    flash[:success] = "The friend request was canceled."
    redirect_to root_url
  end

  private

  def set_friend_request
    @friend_request = FriendRequest.find(params[:id])
  end

  def friend_request_params
    params.require(:friend_request).permit(:friend_id, :user_id)
  end
end
