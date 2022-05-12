class Bookmark < ApplicationRecord
  belongs_to :list
  belongs_to :movie
  belongs_to :user

  validates :comment, length: { minimum: 6 }
  validates :movie_id, uniqueness: { scope: :list_id, message: 'is already in the list' }
  # Autre façon de l'écrire
  # validates_uniqueness_of :movie_id, :scope => [:list_id]
end
