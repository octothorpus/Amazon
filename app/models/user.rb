class User < ApplicationRecord
  has_secure_password


  VALID_EMAIL_REGEX = /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i


  # attr_accessor :password, :password_confirmation
  has_many :votes, dependent: :destroy
  has_many :voted_reviews, through: :votes, source: :review

  has_many :products, dependent: :nullify

  has_many :favourites, dependent: :destroy
  has_many :favourited_products, through: :favourites, source: :product

  has_many :likes, dependent: :destroy
  has_many :users, through: :likes, source: :review



  def full_name
    "#{first_name} #{last_name}".squeeze(" ").strip.titleize
  end

  validates :email, presence: true,
                    uniqueness: {case_sensitive: false},
                    format: VALID_EMAIL_REGEX

  validates :last_name, presence: true

end
