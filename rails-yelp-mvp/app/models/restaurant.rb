class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy

  validates :name, presence: true
  validates :category, inclusion: ["chinese", "italian", "japanese", "french", "belgian"]
  validates :address, presence: true
end
