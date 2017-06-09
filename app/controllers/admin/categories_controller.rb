class Admin::CategoriesController < ApplicationController

  http_basic_authenticate_with name:ENV["HTTP_AUTH_NAME"], password:ENV["HTTP_AUTH_PASS"]
  def index
    render plain: "I am inly accessible if you know the password"
    @categories = Category.order(id: :desc).all
  end

  def new
    render plain: "I am inly accessible if you know the password"
    @category = Category.new
  end

  def create
    render plain: "I am inly accessible if you know the password"
    @category = Category.new(category_params)

    if @category.save
      redirect_to [:admin, :categories], notice: 'CREATED'
    else
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(
      :name,
      :created_at,
      :updated_at
    )
  end
end
