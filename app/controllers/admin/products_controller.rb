class Admin::ProductsController < Admin::BaseController
  respond_to :js, only: [:show, :edit]
  
    def index
      @products = Product.all
  
      respond_to do |format|
        format.html # index.html.erb
      end
    end
  
    def show
      @product = Product.find(params[:id])
    end
  
    def new
      @product = Product.new
      5.times {@product.assets.build}
    end
  
    def edit
      @product = Product.find(params[:id])
      5.times {@product.assets.build}
    end
  
    def create
      @product = Product.new(params[:product])
  
      respond_to do |format|
        if @product.save
          format.html { redirect_to admin_products_path, notice: 'Products was successfully created.' }
        else
          format.html { render action: "new" }
        end
      end
    end
  
    def update
      @product = Product.find(params[:id])
  
      respond_to do |format|
        if @product.update_attributes(params[:product])
          format.html { redirect_to admin_products_path, notice: 'Products was successfully updated.' }
        else
          format.html { render action: "edit" }
        end
      end
    end
  
    def destroy
      @product = Product.find(params[:id])
      @product.destroy
  
      respond_to do |format|
        format.html { redirect_to admin_products_url }
      end
    end
end
