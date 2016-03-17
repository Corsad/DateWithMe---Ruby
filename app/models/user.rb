class User < ActiveRecord::Base
  has_secure_password

  validates :name, uniqueness: true
  validates :email, presence: true
  validates :password, presence: true
end
