class Product < ActiveRecord::Base
  attr_accessible :category_id, :deleted_at, :description, :label_id, :name, :published_at, :published_until, :sales_price, :unit_price
end
