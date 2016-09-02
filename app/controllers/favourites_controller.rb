class FavouritesController < ApplicationController
  before_action :authenticate_user!

  def create
      product = Product.find params[:product_id]
      favourite = Favourite.new user: current_user, product: product
    if favourite.save
      redirect_to product_path(product), notice: "You have favourited this product!"
    else
      redirect_to product_path(product), alert: favourite.errors.full_messages.join(",")
    end
  end

  def destroy
    product = Product.find params[:product_id]
    favourite = Favourite.find params[:id]
    if can? :destroy, favourite
      favourite.destroy
      redirect_to product_path(product), notice: "Unfavourited!!"
    else
      redirect_to root_path, alert: "Access Denied!"
    end
  end
end
