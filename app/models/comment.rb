class Comment < ApplicationRecord
  belongs_to :feature

  # Validaciones
  validates :body, presence: true, length: { minimum: 10, maximum: 1000 }
end
