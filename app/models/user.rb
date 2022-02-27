class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :registerable, :magic_link_authenticatable
  #:database_authenticatable, , :recoverable, :rememberable, :validatable
end
