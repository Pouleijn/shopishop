# == Schema Information
#
# Table name: labelizations
#
#  id          :integer         not null, primary key
#  category_id :integer
#  label_id    :integer
#

class Labelization < ActiveRecord::Base
  attr_accessible :category_id, :label_id, :position, :published

  belongs_to :category, :counter_cache => :labels_count
  belongs_to :label
end
