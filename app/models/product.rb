class Product < ApplicationRecord
  belongs_to :category

  validates :name,
    presence: true,
    uniqueness: true
  validates :price, presence: true
end
