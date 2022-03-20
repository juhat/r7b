# To deliver this notification:
#
# PostNotification.with(post: @post).deliver_later(current_user)
# PostNotification.with(post: @post).deliver(current_user)

class PostNotification < Noticed::Base
  deliver_by :database
  deliver_by :email, mailer: "NotificationMailer", delay: 2.minutes, unless: :read?

  param :post

  def message
    t(".message", title: params[:post].title)
  end

  def url
    post_path(params[:post])
  end

  after_database :update_message_count

  def update_message_count
    recipient.broadcast_action :update, target: "notification-count", html: recipient.notifications.unread.count.to_s
    Rails.logger.info self.record
    # recipient.broadcast_action :prepend, target: "notifications", partial: 'notifications/notification', object: self.record
  end
end
