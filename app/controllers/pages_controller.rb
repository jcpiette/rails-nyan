class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @notifications = Notification.where(user_id: current_user)
    @friends = UserFriend.all
    @events = Event.where(user_id: current_user)
    @users = User.pluck(:full_name).sort
  end
end
