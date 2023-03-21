class AdoptionForm < ApplicationRecord
  belongs_to :cat

  validates :first_name, presence: true { message: "On a besoin de ton prénom xoxo" }
  validates :last_name, presence: true { message: "On a besoin de ton nom xoxo" }
  validates :email, 
    presence: true { message: "Il faut un email pour qu'on puisse te recontacter !" }
    format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "Ton email n'a pas le bon format mon coco ! " }
  validates :phone_number, 
    uniqueness: true,
    presence: true { message: "On a besoin de ton numéro de téléphone pour te contacter ! Promis, on fera pas de spam" }
end
