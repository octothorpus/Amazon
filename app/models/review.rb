class Review < ApplicationRecord
  belongs_to :product
  #must be in a singular form
  validates :star_count, presence: true, inclusion: {in: 1..5}
                        # :presence => true (old way)

 has_many :votes, dependent: :destroy
 has_many :voted_reviews, through: :votes, source: :reviews

  has_many :likes, dependent: :destroy
  has_many :users, through: :likes

  def like_for(user)
    likes.find_by_user_id(user.id)
  end

  def user_has_likes?(user)
    like_for(user).present?
  end

end
