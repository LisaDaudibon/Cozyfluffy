class Cat < ApplicationRecord
  has_many :adoption_forms, dependent: :destroy

  validates :name, presence: true
  validates :birth_date, presence: true
end
