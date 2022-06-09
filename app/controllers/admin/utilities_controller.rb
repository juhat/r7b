class Admin::UtilitiesController < ApplicationController
  def notification
    admin = User.find_by(email: "admin@example.com")
    user = User.find_by(email: "user@example.com")

    Announcement.create!(
      user: [admin, user].shuffle.first,
      title: Faker::Book.title,
      content: Faker::Lorem.paragraphs(
        number: (5..10).to_a.shuffle.first
      ).map { |paragraph| "<p>#{paragraph}</p>" }.join
    )

    head :ok
  end
end
