class AdoptionForm < ApplicationRecord
  belongs_to :cat

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, 
    presence: true,
    format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "Ton email n'a pas le bon format mon coco ! " }
  validates :phone_number, presence: true

  after_create :adoption_send

  def adoption_send
    UserMailer.adoption_email(self).deliver_now
  end
end
