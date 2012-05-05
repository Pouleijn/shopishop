# == Schema Information
#
# Table name: employees
#
#  id         :integer         not null, primary key
#  first_name :string(255)
#  last_name  :string(255)
#  gender     :string(10)
#  birthday   :date
#  bio        :text
#  role       :string(10)      default("seller")
#  user_id    :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Employee < ActiveRecord::Base
  ROLES = %w(seller admin)

  belongs_to :user, :dependent => :destroy

  attr_accessible :bio, :birthday, :first_name, :gender, :last_name, :user_attributes

  validates :first_name, presence: true, format: {:with => /^[-\w\._]+$/i }
  validates :last_name, presence: true, format: {:with => /^[-\w\._]+$/i }
  validates :gender, presence: true, length: { within: 1..10 }, inclusion: { in: User::GENDER }
  validates :role, presence: true, length: { within: 1..10 }, inclusion: { in: ROLES }

  validates :user, presence: true

  accepts_nested_attributes_for :user, allow_destroy: true

  def full_name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end
end
