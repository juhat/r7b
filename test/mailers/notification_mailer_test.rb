require "test_helper"

class NotificationMailerTest < ActionMailer::TestCase
  test "announcement_notification" do
    mail = NotificationMailer.announcement_notification
    assert_equal "Announcement notification", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
