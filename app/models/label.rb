class Label < ActiveRecord::Base
  attr_accessible :name

  has_many :labelizations, :dependent => :destroy
  has_many :categories, :through => :labelizations

  validates :name, presence: true, uniqueness: true
end
