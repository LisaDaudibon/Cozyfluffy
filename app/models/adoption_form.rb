class AdoptionForm < ApplicationRecord
  belongs_to :cat

  validates :first_name, presence: true { message: "On a besoin de ton prénom xoxo" }
  validates :last_name, presence: true { message: "On a besoin de ton nom xoxo" }
  validates :email,
    presence: true { message: "Il faut un email pour qu'on puisse te recontacter !" }
    format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "Ton email n'a pas le bon format mon coco ! " }
  validates :test_phone_number

  private
    def test_phone_number
      if self.phone_number.absent?
        errors.add (:phone_number, "Enfin voyons, envoie le num, très cher ami ! On va t'appeler lapin quand même ?")
      end
    end
end
