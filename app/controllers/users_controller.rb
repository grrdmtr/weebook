class UsersController < ApplicationController

  def index
    @users = User.all.order('created_at DESC')
  end

  def befriend(user)
    friends << user
  end

  def unfriend(user)
    friends.delete(user)
  end

  def friends?(user)
    friends.include?(user)
  end
end
