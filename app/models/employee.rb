class Employee < ActiveRecord::Base
  ROLES = %w(seller admin)

  belongs_to :user, :dependent => :destroy

  attr_accessible :bio, :birthday, :first_name, :gender, :last_name, :user_attributes

  validates :first_name, presence: true, format: {:with => /^[-\w\._]+$/i }
  validates :last_name, presence: true, format: {:with => /^[-\w\._]+$/i }
  validates :gender, presence: true, length: { within: 1..10 }, inclusion: { in: User::GENDER }
  validates :role, presence: true, length: { within: 1..10 }, inclusion: { in: ROLES }

  accepts_nested_attributes_for :user, allow_destroy: true

  def full_name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end
end
