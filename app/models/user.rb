class User < ApplicationRecord
  attr_accessor :password, :encrypted_password

  has_many :invites, as: :invited_by, class_name: "User"

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :registerable, :confirmable, :magic_link_authenticatable
  # :database_authenticatable, , :recoverable, :rememberable, :validatable

  def update_with_password(params, *options)
    update(params, *options)
  end

  def after_database_authentication
  end
end
