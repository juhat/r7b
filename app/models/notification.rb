class Notification < ApplicationRecord
  include Noticed::Model
  belongs_to :recipient, polymorphic: true

  after_create_commit do
    broadcast_update_to recipient,
                        "notifications",
                        target: "notification-count",
                        partial: "notifications/notification_count",
                        locals: { user: recipient }
  end
end
