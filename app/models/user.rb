class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :registerable, :confirmable, :magic_link_authenticatable
  #:database_authenticatable, , :recoverable, :rememberable, :validatable

  def update_with_password(params, *options)
    update(params, *options)
  end
end
