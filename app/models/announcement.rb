class Announcement < ApplicationRecord
  belongs_to :user

  has_rich_text :summary
  has_rich_text :content
  has_noticed_notifications

  # after_create :notify_people

  broadcasts(inserts_by: :prepend)

  private

  def notify_people
    AnnouncementNotification.with(announcement: self).deliver_later(User.all)
  end
end
