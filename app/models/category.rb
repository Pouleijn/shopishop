class Category < ActiveRecord::Base
  attr_accessible :name, :position, :published

  has_many :labelizations, :dependent => :destroy
  has_many :labels, :through => :labelizations

  acts_as_list

  validates :name, presence: true, uniqueness: true, format: {:with => /^[-\w\._]+$/i }, length: { within: 1..20 }

  accepts_nested_attributes_for :labels, allow_destroy: true

  scope :public, lambda { where(:published => true) }
  default_scope { order(:position) }
end
