class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @notifications = Notification.where(user_id: current_user)
    @friends = UserFriend.where(friend_id: current_user)
    @events = Event.where(user_id: current_user)
  end

end
