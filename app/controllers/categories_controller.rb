class CategoriesController < ApplicationController
	def label_name
		@products = Product.get_products_by_params params
	end

	def category_name
		@products = Product.get_products_by_params params
	end
end