class Cat < ApplicationRecord
  has_many :adoption_forms

  validates :name, presence: true
  validates :age, presence: true
  validates :adoption, presence: true
end
