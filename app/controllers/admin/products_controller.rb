class Admin::ProductsController < ApplicationController
  def index
    @products = Product.order('name')
  end

  def show
    @product = Product.find(params[:product_id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(params.require(:product).permit!)
    if @product.save
      redirect_to admin_products_path, notice: "Product #{@product.id} was created"
    else
      render 'new'
    end
  end
end
