class NotificationMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification_mailer.announcement_notification.subject
  #
  def announcement_notification
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
