class ProductsController < ApplicationController

    def show
      @product = Product.find params[:id]
      @review = Review.new
      @reviews = @product.reviews
      #because you are displaying the review form on the product page, you need to define this instance variable @review.
    end


    def index
      @products = Product.order(created_at: :desc)
    end

    def new
      @product = Product.new
    end


    def create
    product_params = params[:product] #{title: "asd fasdff", body: "asdf asd f"}
      # we're using the 'strong parameters' feature of Rails here to only allow mass-assigning the attributes that we want to allow the user to set.
      product_params = params.require(:product).permit([:title, :body])
      @product        = Product.new product_params

      if @product.save
        redirect_to product_path({id: @product})
      else
        render :new
      end
  end
end
