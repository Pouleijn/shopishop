# == Schema Information
#
# Table name: labels
#
#  id         :integer         not null, primary key
#  name       :string(20)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Label < ActiveRecord::Base
  attr_accessible :name

  has_many :labelizations, :dependent => :destroy
  has_many :categories, :through => :labelizations

  validates :name, presence: true, uniqueness: true
end
