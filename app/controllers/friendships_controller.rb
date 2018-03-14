class FriendshipsController < ApplicationController
  def create
    user = User.find_by(id: params[:user_id])
    friendship = user.friendships.build(friend_id: params[:friend_id])
    if friendship.save
      redirect_to user
    end
  #   else show some errors
  end
end
