# To deliver this notification:
#
# AnnouncementNotification.with(announcement: @announcement).deliver_later(current_user)
# AnnouncementNotification.with(announcement: @announcement).deliver(current_user)

class AnnouncementNotification < Noticed::Base
  deliver_by :database
  deliver_by :email, mailer: "NotificationMailer", delay: 2.minutes, unless: :read?

  param :announcement

  def message
    t(".message", title: params[:announcement].title)
  end

  def url
    announcement_path(params[:announcement])
  end

  after_database :update_message_count

  def update_message_count
    recipient.broadcast_action :update, target: "notification-count", html: recipient.notifications.unread.count.to_s
    Rails.logger.info self.record
    # recipient.broadcast_action :prepend, target: "notifications", partial: 'notifications/notification', object: self.record
  end
end
