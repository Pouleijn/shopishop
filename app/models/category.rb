class Category < ActiveRecord::Base
  attr_accessible :name, :position, :published

  has_many :labelizations
  has_many :labels, :through => :labelizations

  acts_as_list

  validates :name, presence: true, uniqueness: true

  scope :public, lambda { where(:published => true) }
  default_scope { order(:position) }

  # TODO: a lot baby!
  # http://hastebin.com/yayejiqode.vhdl
end
