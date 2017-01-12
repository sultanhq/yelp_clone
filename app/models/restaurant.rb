class Restaurant < ApplicationRecord
  belongs_to :user
  has_many :reviews,
    -> { extending WithUserAssociationExtension },
      dependent: :destroy

  validates :name, length: {minimum: 3}, uniqueness: true

  def build_review(attributes = {}, user)
    review = reviews.build(attributes)
    review.user = user
    review
  end

  def average_rating
    output = 0
    self.reviews.each do |review|
      output += review.rating
    end
    output = output/self.reviews.count
  end
end
