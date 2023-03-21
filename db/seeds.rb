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
Product.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('products')
Category.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('categories')

# Création de l'admin principal
main_admin = User.create(
  pseudo: 'Admin',
	email: 'cozyfluffy@yopmail.com',
	password: 'fluffy123',
	is_admin: 'true'
	)

# Création de 4 chats
Cat.create(
  name: 'Mistigri',
  birth_date: Date.new(2017,3,12),
  description: "La maman du salon, elle supervise tout avec bienveillance",
  adoption: false
)

Cat.create(
  name: 'Ronron',
  birth_date: Date.new(2014,10,24),
  description: "Comme son nom l'indique, il ronronne à tout va et adore les câlins",
  adoption: false
)

Cat.create(
  name: 'Filou',
  birth_date: Date.new(2021,4,6),
  description: "Toujours caché dans un coin, il aime être au chaud",
  adoption: true
)

Cat.create(
  name: 'Patoune',
  birth_date: Date.new(2023,1,10),
  description: "Le bébé de la bande, il est plein d'énergie et adore jouer",
  adoption: true
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
hot_prices = ['2,00', '2,50', '3,00', '4,00', '4,00', '4,00', '3,50', '4,00', '4,00', '3,00']

10.times do |i|
  Product.create(
    name: hot_drinks[i],
    price: hot_prices[i],
    category_id: 1
  )
end

# Boissons froides
cold_drinks = ['Eau bouteille', "Menthe à l'eau", 'Thé froid', 'Limonade', 'Orangina', 'Coca-Cola', "Jus d'orange", 'Smoothie banane', 'Smoothie kiwi', 'Smoothie fraise']
cold_prices = ['2,00', '3,00', '3,50', '3,50', '4,00', '4,00', '4,00', '5,00', '5,00', '5,00']

10.times do |i|
  Product.create(
    name: cold_drinks[i],
    price: cold_prices[i],
    category_id: 2
  )
end

# Pâtisseries
pastries = ['Flan', 'Quatre-quart', 'Cookie', 'Brownie', 'Carrot cake', 'Crumble', 'Banoffee']
pastry_prices = ['3', '3', '3', '3', '4', '4', '5']

7.times do |i|
  Product.create(
    name: pastries[i],
    price: pastry_prices[i],
    category_id: 3
  )
end

# Encas
snacks = ['Toast', 'Bagel', 'Quiche', 'Sandwich', 'Croque-monsieur', 'Salade césar', 'Salade niçoise']
snack_prices = ['6,50', '7', '7', '8', '8', '9', '9']

7.times do |i|
  Product.create(
    name: snacks[i],
    price: snack_prices[i],
    category_id: 4
  )
end