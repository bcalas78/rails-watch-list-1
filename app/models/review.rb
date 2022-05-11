class Review < ApplicationRecord
  belongs_to :list
  belongs_to :user
  validates :comment, length: { minimum: 10 }
end
