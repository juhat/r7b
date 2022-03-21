# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.destroy_all

sleep 2

puts "Deleting existing data..."

Sidekiq.redis(&:flushdb)

admin = User.create!(email: "admin@example.com", terms_accepted: true, admin: true, confirmed_at: Time.now)
user = User.create!(email: "user@example.com", terms_accepted: true, admin: false, confirmed_at: Time.now)

puts "Admin user created with #{admin.email}"
puts "Normal user created with #{user.email}"

11.times do |num|
  Announcement.create!(
    user: [admin, user].shuffle.first,
    title: Faker::Book.title,
    content: Faker::Lorem.paragraphs(
      number: (5..10).to_a.shuffle.first
    ).map { |paragraph| "<p>#{paragraph}</p>" }.join
  )
end

puts "11 announcements are created with random authors"