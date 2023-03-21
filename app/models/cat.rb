class Cat < ApplicationRecord
  has_many :cats

  validates :name, presence: true
  validates :age, presence: true
  validates :adoption, presence: true
end
