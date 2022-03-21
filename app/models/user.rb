class User < ApplicationRecord
  devise :validatable, :registerable, :confirmable, :magic_link_authenticatable, :invitable

  attr_accessor :password, :encrypted_password
  has_many :invites, as: :invited_by, class_name: "User"
  has_many :notifications, as: :recipient, dependent: :destroy
  has_many :announcements, dependent: :destroy

  scope :admin, -> { where(admin: true) }

  validates :email, inclusion: {
    in: proc { Setting.allowed_email_addresses + User.admin.pluck(:email) }
  }, if: proc { Setting.restrict_access_to_allowed_email_addresses }
  validates :terms_accepted, acceptance: true

  # Devise password-less
  def update_with_password(params, *options)
    update(params, *options)
  end

  def after_database_authentication
  end

  def password_required?() = false
end
