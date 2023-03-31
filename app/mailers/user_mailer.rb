class UserMailer < ApplicationMailer

    default from: 'cozyhoshii@gmail.com'

    def welcome_email(user)
      #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
      @user = user 
  
      #on définit une variable @url qu'on utilisera dans la view d’e-mail
      @url  = "https://git.heroku.com/cozyfluffy.git"
  
      # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
      mail(to: @user.email, subject: 'Bienvenue chez nous !') 
    end

      def event_email(user, event)
        @user = user 
        @event = event
        #on définit une variable @url qu'on utilisera dans la view d’e-mail
        @url  = "https://git.heroku.com/cozyfluffy.git"
    
        # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
        mail(to: user.email, subject: 'Nouvel événement à venir !')
      end

      def adoption_email(adoption_form)
        @adoption_form.cat= @cat = cat.find_by(adoption_form.id)
        @admins = User.where(is_admin: true)
        
        @admins.each do |admin|
          @adoptant = adoption_form
          @url  = "https://git.heroku.com/cozyfluffy.git"
          mail(to: admin.email, subject: 'Nouveau Formulaire !')
        end
     
      end
end
