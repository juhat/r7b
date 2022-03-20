class NotificationsController < ApplicationController
  def index
  end

  def create
    current_user.notifications.unread.mark_as_read!
    redirect_to notifications_path
  end
end
