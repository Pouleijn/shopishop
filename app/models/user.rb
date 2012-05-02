class User < ActiveRecord::Base
  GENDER = %w(male female)

  has_secure_password

  has_one :employee

  attr_accessible :email, :password, :password_confirmation

  validates_uniqueness_of :email
end
