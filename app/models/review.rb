class Review < ApplicationRecord
  belongs_to :list
  validates :comment, length: { minimum: 10 }
end
