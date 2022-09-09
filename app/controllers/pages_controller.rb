class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @notifications = Notification.where(user_id: current_user)
    @friends = UserFriend.all
    @events = Event.all
    @nunlinked_users = User.pluck(:full_name).sort
    @relations = User.pluck(:full_name).sort
    @event = Event.new
  end
end
