class Labelization < ActiveRecord::Base
  attr_accessible :category_id, :label_id, :position, :published

  belongs_to :category
  belongs_to :label
end
