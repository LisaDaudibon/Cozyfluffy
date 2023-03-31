class AdoptionForm < ApplicationRecord
  belongs_to :cat

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, 
    presence: true,
    format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "n'a pas le bon format mon coco ! " }
  validates :phone_number, presence: true
end
