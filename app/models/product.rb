# == Schema Information
#
# Table name: products
#
#  id              :integer         not null, primary key
#  name            :string(255)
#  description     :text
#  unit_price      :decimal(, )
#  sales_price     :decimal(, )
#  published_at    :datetime
#  published_until :datetime
#  deleted_at      :datetime
#  category_id     :integer
#  label_id        :integer
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#

class Product < ActiveRecord::Base
  attr_accessible :category_id, :deleted_at, :description, :label_id, :name, :published_at, :published_until, :sales_price, :unit_price

  belongs_to :category
  belongs_to :label
end
