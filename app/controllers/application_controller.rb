class ApplicationController < ActionController::Base
  private

  REQUESTING_FRIENDS_IDS = [2]

  def create_friend_invitations
    REQUESTING_FRIENDS_IDS.each do |requester_id|
      FriendRequest.create(user: User.find(requester_id), friend: @user)
    end
  end
end
