class Review < ApplicationRecord
  belongs_to :restaurant

  validates :content, presence: true
  validates :rating, presence: true
  validates :rating, numericality: { greater_than_or_equal_to: 0, less_than: 6, only_integer: true}
end
