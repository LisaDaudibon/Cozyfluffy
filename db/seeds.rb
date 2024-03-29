# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('users')
Cat.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('cats')
Event.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('events')
Product.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('products')
Category.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('categories')

# Création de l'admin principal
main_admin = User.create(
  pseudo: 'Admin',
	email: 'cozyhoshii@gmail.com',
	password: 'fluffy123',
	is_admin: true
)

# Création de 6 chats
Cat.create(
  name: 'Mistigri',
  birth_date: Date.new(2017,3,12),
  description: "Mistigri est un peu la maman du salon, elle supervise tout avec bienveillance, et s'occupe des petits.",
  adoption: false,
  image_url: "https://images.unsplash.com/photo-1491485880348-85d48a9e5312?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80"
)

Cat.create(
  name: 'Ronron',
  birth_date: Date.new(2014,10,24),
  description: "Comme son nom l'indique, il ronronne à tout va et adore les câlins. C'est la mascotte du salon!",
  adoption: false,
  image_url: "https://images.unsplash.com/photo-1571570703598-39eb580a0329?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2072&q=80"
)

Cat.create(
  name: 'Filou',
  birth_date: Date.new(2021,4,6),
  description: "Etant très affectueux, si Filou vous choisi il vous suivra de partout et réclamera des gratouilles.",
  adoption: true,
  image_url: "https://images.unsplash.com/photo-1513360371669-4adf3dd7dff8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"
)

Cat.create(
  name: 'Patoune',
  birth_date: Date.new(2023,1,10),
  description: "Le bébé de la bande, il est plein d'énergie et adore jouer! Un petit chasseur dans l'âme.",
  adoption: true,
  image_url: "https://images.unsplash.com/photo-1626170733247-dfc57b1186df?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"
)

Cat.create(
  name: 'Topaz',
  birth_date: Date.new(2021,6,6),
  description: "Étant très affectueuse et joueuse, Topaz s'entend très bien avec les enfants.",
  adoption: true,
  image_url: "https://images.unsplash.com/photo-1620196244888-d31ff5bbf163?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"
)

Cat.create(
  name: 'Onyx',
  birth_date: Date.new(2023,2,10),
  description: "De nature calme, Onyx préfèrera la tranquillité et les siestes. Offrez-lui vos genoux et il ne vous lachera pas.",
  adoption: true,
  image_url: "https://images.unsplash.com/photo-1514993808123-26d90301ceaf?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1171&q=80"
)

# Création de 2 évènements
Event.create(
  title: "Fête de lancement du salon",
  date: Date.new(2023,4,5),
  description: "Depuis la naissance de l'association Cozy & Fluffy le 12 Janvier 2023, beaucoup de choses se sont passées... Il est bientôt temps de fêter l'ouverture du salon de thé !",
  user_id: 1
)

Event.create(
  title: "Sensibilisation à la stérilisation",
  date: Date.new(2023,4,15),
  description: "Une portée non désirée est à l'origine de l'abandon de nombreux chatons, qui peuvent mourir faute de soins, d'alimentation ou grandir dans de mauvaises conditions.",
  user_id: 1
)

### Création du menu

# Catégories
category_names = ['Boissons chaudes', 'Boissons froides', 'Pâtisseries', 'Encas']
4.times do |i|
  Category.create(
    name: category_names[i]
  )
end

# Boissons chaudes
hot_drinks = ['Expresso', 'Café allongé', 'Café latte', 'Cappuccino', 'Chocolat chaud', 'Chaï latte', 'Earl grey', 'Matcha', 'Rooibos', 'Infusion au choix']
hot_prices = ['2.00', '2.50', '3.00', '4.00', '4.00', '4.00', '3.50', '4.00', '4.00', '3.00']

10.times do |i|
  Product.create(
    name: hot_drinks[i],
    price: hot_prices[i],
    category_id: 1
  )
end

# Boissons froides
cold_drinks = ['Eau bouteille', "Menthe à l'eau", 'Thé froid', 'Limonade', 'Orangina', 'Coca-Cola', "Jus d'orange", 'Smoothie banane', 'Smoothie kiwi', 'Smoothie fraise']
cold_prices = ['2.00', '3.00', '3.50', '3.50', '4.00', '4.00', '4.00', '5.00', '5.00', '5.00']

10.times do |i|
  Product.create(
    name: cold_drinks[i],
    price: cold_prices[i],
    category_id: 2
  )
end

# Pâtisseries
pastries = ['Flan', 'Quatre-quart', 'Cookie', 'Brownie', 'Carrot cake', 'Crumble', 'Banoffee']
pastry_prices = ['3.00', '3.00', '3.00', '3.00', '4.00', '4.00', '5.00']

7.times do |i|
  Product.create(
    name: pastries[i],
    price: pastry_prices[i],
    category_id: 3
  )
end

# Encas
snacks = ['Toast', 'Bagel', 'Quiche', 'Sandwich', 'Croque-monsieur', 'Salade césar', 'Salade niçoise']
snack_prices = ['6.50', '7.00', '7.00', '8.00', '8.00', '9.00', '9.00']

7.times do |i|
  Product.create(
    name: snacks[i],
    price: snack_prices[i],
    category_id: 4
  )
end