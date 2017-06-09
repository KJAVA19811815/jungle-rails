class Admin::ProductsController < ApplicationController
  name = ENV["HTTP_AUTH_NAME"]
  password = ENV["HTTP_AUTH_PASS"]


  http_basic_authenticate_with name: name, password: password

  def index
    render plain: "I am inly accessible if you know the password"
    @products = Product.order(id: :desc).all
  end

  def new
    render plain: "I am inly accessible if you know the password"
    @product = Product.new
  end

  def create
    render plain: "I am inly accessible if you know the password"
    @product = Product.new(product_params)

    if @product.save
      redirect_to [:admin, :products], notice: 'Product created!'
    else
      render :new
    end
  end

  def destroy
    render plain: "I am inly accessible if you know the password"
    @product = Product.find params[:id]
    @product.destroy
    redirect_to [:admin, :products], notice: 'Product deleted!'
  end

  private

  def product_params
    params.require(:product).permit(
      :name,
      :description,
      :category_id,
      :quantity,
      :image,
      :price
    )
  end

end
