class ProductsController < ApplicationController
  def show
    @product = Product.find(params["id"])
    redirect_to root_url if @product.blank?
    
    @product_question = ProductQuestion.new
  end
end