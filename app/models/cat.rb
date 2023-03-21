class Cat < ApplicationRecord
  has_many :adoption_forms, dependent: :destroy

  validates :name, presence: true
  validates :age, presence: true
  validates :adoption, presence: true
end
