# Description
<img src=/app/assets/images/cozy.png width="200" align="right" />
Ce projet de site web est la vitrine d'un salon de thé associatif sur le concept de bar à chats, l'association à but non lucratif "Cozy & Fluffy" accueille donc des chats de manière permanente ou temporaire et facilite leur adoption. Les fonds du salon de thé servent à faire fonctionner l'association.  

Il s'agit du projet final de la formation THP Fullstack du groupe Cozy & Fluffy.  
Lien du site en production : https://cozyfluffy.herokuapp.com

## Cahier des charges
- Executive summary, disponible sur [Google Docs](https://docs.google.com/document/d/1DrETqztTcQTJiFipLb5W6aw6aajQehMRc0twlfnxpyc/edit#heading=h.lekq4on0km5s)
- Users stories, disponible sur [Trello](https://trello.com/b/3cWWWov9/cozy-fluffy)
- Design du site, disponible sur [Figma](https://www.figma.com/file/yt0mUXTpcsOyUIc003yAZc/Untitled?node-id=0-1&t=2N2gOae54vuPXuQP-0)
- Parcours utilisateur (à faire sur Lucid)

## Membres du groupe
- Lisa Daudibon (@LisaDaudibon)
- Karine Da Silva (@KarineDHoshi)
- Chandara Loek (@Daralafada)
- Suzanne Christé (@Suziwan)

## Versions utilisées
Ruby 3.0.0, Rails 7.0.4.2, PostgreSQL 1.1.  
Gems importantes : Stripe 5.53, Dotenv, Devise.  
Hébergement : Heroku.

## Lancement du programme en local
Télécharger le dossier GitHub en local ou le cloner, puis vérifier les versions utilisées.  
Lancer un `bundle install` pour installer les versions et gems mentionnées.  
Faire un `rails db:create db:migrate db:seed` pour créer et remplir la base de données.  
Lancer le serveur avec `rails s` pour visualiser le site sur localhost:3000.  

## Diagramme ER base de données
Ci-dessous un diagramme entité-relation de la base de données utilisée :  

<img src=/app/assets/images/database_cozyfluffy.png width="700">
