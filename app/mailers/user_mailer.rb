class UserMailer < ApplicationMailer

  default from: 'cozyhoshii@gmail.com'

  def welcome_email(user)
    # on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @user = user 

    # on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = "https://git.heroku.com/cozyfluffy.git"

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @user.email, subject: 'Bienvenue chez nous !') 
  end

  def event_email(user, event)
    @user = user 
    @event = event
    # on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = "https://git.heroku.com/cozyfluffy.git"

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: user.email, subject: 'Nouvel événement à venir !')
  end

  def brunch_email(mail, name)
    @name = name 
    # on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = "https://git.heroku.com/cozyfluffy.git"

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: mail, subject: 'Bon cadeau brunch')
  end

  def adoption_email(adoption_form)
    @adoption_form = adoption_form
    # on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = "https://git.heroku.com/cozyfluffy.git"

    User.all.each do |user|
    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
        mail(to: user.email, subject: 'Nouveau formulaire !') if user.is_admin
    end 
  end
end
