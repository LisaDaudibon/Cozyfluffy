class Category < ApplicationRecord
  has_many :products, dependant: :destroy

  validates :name, presence: true
end
