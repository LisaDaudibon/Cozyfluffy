class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events

  validates :pseudo, 
    presence: true, 
    uniqueness: { scope: :true, message: "Le pseudo %{value} est déjà pris ! Sorry xo xo" }

end
