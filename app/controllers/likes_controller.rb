class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    review = Review.find params[:review_id]
    like = Like.new user: current_user, review: review

    if like.save
      redirect_to product_path(review.product_id), notice: "You liked a review for this product."
    else
      redirect_to product_path(review.product_id), alert: like.errors.full_messages.join(", ")
    end
  end

  def destroy
    like = Like.find(params[:id])
    review = Review.find(params[:review_id])

    if like.destroy
      redirect_to product_path(review.product_id), notice: "You've unliked a review for this product."
    end
  end

end
