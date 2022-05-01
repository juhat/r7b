class NotificationsController < ApplicationController
  def index
    @notifications = current_user.notifications.newest_first.map(&:to_notification)
  end
  def create
    current_user.notifications.unread.mark_as_read!
    redirect_to notifications_path
  end
  def show
  end
end
