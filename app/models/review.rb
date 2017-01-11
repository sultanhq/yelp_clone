class Review < ApplicationRecord
	belongs_to :user
	belongs_to :though
	validates :rating, inclusion: (1..5)
end
