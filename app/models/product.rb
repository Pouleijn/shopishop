# == Schema Information
#
# Table name: products
#
#  id              :integer         not null, primary key
#  name            :string(20)      not null
#  description     :text
#  unit_price      :decimal(, )     not null
#  sales_price     :decimal(, )
#  published_at    :date            not null
#  published_until :date
#  deleted_at      :datetime
#  category_id     :integer         not null
#  label_id        :integer         not null
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#

class Product < ActiveRecord::Base
  attr_accessible :category_id, :deleted_at, :description, :label_id, :name, 
  								:published_at, :published_until, :sales_price, :unit_price,
  								:assets_attributes

  belongs_to :category
  belongs_to :label
  has_many :assets, :as => :asset_able
  has_many :product_questions

  validates :name, presence: true, uniqueness: true
  validates :unit_price, presence: true
  validates :published_at, presence: true
  validates :category_id, presence: true
  validates :label_id, presence: true

  accepts_nested_attributes_for :assets, :allow_destroy => true;

  default_scope order: 'updated_at DESC'

   def self.get_products_by_params params, datetime=Date
		category_name = params.fetch(:category_name)
		label_name 		= params.fetch(:label_name, nil)

		category 			= Category.where(name: category_name).first

		options = {}
		options[:category_id] = category.id

		unless label_name.blank?
			label 			= Label.where(name: label_name).first 
			options[:label_id] = label.id
		end

		where(options)
	end
end
