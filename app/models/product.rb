class Product < ApplicationRecord
#
#   # Add the following callbacks methods to your product model:
#
# # 1. A callback method to set the default price to 1
# # 2. A callback method to capitalize the product title before saving
#

# must define that a product has many reviews, but a review can only belong to one product
# must be plural
has_many :reviews

has_many :favourites, dependent: :destroy
belongs_to :user
has_many :users, through: :favourites

after_initialize :set_default_price

before_save :capitalize_product

validates :title, presence: true, uniqueness: { case_sensitive: false, message: 'must be unique!!' }

validates :price, presence: true, numericality: { greater_than: 0 }

validates :description, presence: true, length: { minimum: 10 }

    def capitalize_product
        product.capitalize! if title
    end

    def favourite_for(user)
    favourites.find_by_user_id user
    end

    private

    def set_default_price
      self.price ||= 1
    end

    def self.search(keyword)
        where(['title ILIKE? OR description ILIKE?', "%#{keyword}%", "%#{keyword}%"])
    end


end

# #
# Add the following validations to your Product model:
# - The title must be present
# - The title must be unique (case insensitive)
# - The price must be a number that is more than 0
# - The description must be present
# - The description must have at least 10 characters

# this validates that the title/body combination is unique which means that title doesn't have to be unique by itself, body doesn't have to be unique by itseld but the combination of the two must be unique.
# validates :body, uniqueness: {scope: :title}

#
# Add a custom methods called `search` to the product model to search for a product with its title or description if it contains a specific word. For instance you should be able to do:
#
# Product.search("car")
#
# Which should return all the products that have the word car in it's title or description (case insensitive).
