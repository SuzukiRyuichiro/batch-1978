class Restaurant < ApplicationRecord
  CATEGORIES = ["chinese", "italian", "japanese", "french", "belgian"].freeze
  has_many :reviews, dependent: :destroy

  validates :name, presence: true
  validates :category, inclusion: CATEGORIES
  validates :address, presence: true
end
