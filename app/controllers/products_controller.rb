class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find(params[:id])
    @reviews = Review.where product_id: @product.id
    @review = Review.new
    #puts @reviews.inspect
  end

  #def destroy
    #@product = Product.find params[:id]
    #@product.destroy
    #redirect_to [:admin, :product], notice: "product deleted"
  #end


end
