# == Schema Information
#
# Table name: categories
#
#  id           :integer         not null, primary key
#  position     :integer
#  name         :string(20)
#  published    :boolean         default(FALSE)
#  labels_count :integer         default(0)
#  created_at   :datetime        not null
#  updated_at   :datetime        not null
#

class Category < ActiveRecord::Base
  attr_accessible :name, :position, :published

  has_many :labelizations, :dependent => :destroy
  has_many :labels, :through => :labelizations

  accepts_nested_attributes_for :labels, allow_destroy: true

  acts_as_list

  validates :name, presence: true, uniqueness: true, format: {:with => /^[-\w\._]+$/i }, length: { within: 1..20 }

  accepts_nested_attributes_for :labels, allow_destroy: true

  scope :public, lambda { where(:published => true) }
  default_scope { order(:position) }
end
