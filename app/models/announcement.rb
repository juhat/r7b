class Announcement < ApplicationRecord
  belongs_to :user

  has_rich_text :summary
  has_rich_text :content
  has_noticed_notifications

  after_create :notify_people

  after_create_commit { broadcast_prepend_to('announcements', target: 'announcements') }

  private

  def notify_people
    AnnouncementNotification.with(announcement: self).deliver_later(User.all)
  end
end
