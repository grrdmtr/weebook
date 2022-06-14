class FriendRequestsController < ApplicationController
  def index
    @incoming = FriendRequest.where(friend: current_user)
    @outgoing = current_user.friend_requests
  end

  def create
    friend = User.find(params[:friend_id])
    @friend_request = current_user.friend_requests.create(friend: friend)

    if @friend_request.save
      flash[:notice] = 'Friend request sent'
      redirect_to root_path
    else
      render json: @friend_request.errors, status: :unprocessable_entity
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
    @friend_request = FriendRequest.where(user_id: params[:id], friend_id: current_user.id)
    @friend_request.destroy_all
    head :no_content
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
