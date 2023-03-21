class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events, dependant: :destroy

  validates :test_pseudo

  private
  def test_pseudo
    if User.find_by(pseudo: self.pseudo)
      errors.add (:pseudo, "Le pseudo est déjà pris ! Sorry xo xo")
#"Le pseudo %{value} est déjà pris ! Sorry xo xo" <== à essayer d'implémenter plus tard le %{value}

    elsif self.pseudo.absent?
      errors.add (:pseudo, "Enfin voyons, donne nous ton pseudo, on veut pouvoir t'appeler ! On va t'appeler lapin quand même ?")
    end
  end
end
