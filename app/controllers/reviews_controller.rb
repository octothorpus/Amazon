class ReviewsController < ApplicationController

  def create

    @product = Product.find params[:product_id]
    @review = @product.reviews.new reviews_params
    #makes the new review have to belong to a product (association must exist!)
    if @review.save
      redirect_to @product, notice: "thank you!"
    else
      redirect_to @product, alert: "review failed! #{@review.errors.messages}"
    end
  end

  def destroy
  end

  def update
  end

  private

  def reviews_params
    params.require(:review).permit(:star_count, :body)


  end

end
