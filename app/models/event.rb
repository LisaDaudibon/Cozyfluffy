class Event < ApplicationRecord
  validates :title, presence: true: { message: "Ajoute un titre à ton évènement, enfin voyons ;)" }
  validates :date, presence: true: { message: "Les visiteurs ont besoin d'une date ! Il faut les prévenir de la fin du monde :P" }
end
