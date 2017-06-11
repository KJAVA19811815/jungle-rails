class ReviewsController < ApplicationController

  before_action :confirm_user, :only => [:create, :destroy]

  def create
    #@product = Product.find(params[:product_id])
    #@review = @product.reviews.new(review_params)
    @review = Review.new(review_params)
    @review.user = current_user
    @review.product_id = params[:product_id]
    if @review.save
      session[:review_id] = @review.id
      redirect_to "/products/#{@review.product_id}"
    else
      redirect_to '/products'
 end
end

  def destroy
   @review =  Review.find(params[:id])
   @review.destroy
   flash[:success] = "Review deleted"
   redirect_to "/products"
end

private

 def confirm_user
   if current_user
   end
 end 

 def review_params
   params.require(:review).permit(:description, :rating)
 end
end
