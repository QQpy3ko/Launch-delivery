# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# MenuItem.create(title: '“GHOMI” CORN PORRIDGE BALLS WITH ALMOND SAUCE', price: 3.3, active: false, category_id: 1, created_at: Date.today - rand(10).days)
# MenuItem.create(title: '“ELARJI” CORN PORRIDGE BALLS WITH ALMOND SAUCE ', price: 4.2, active: true, category_id: 1)
# MenuItem.create(title: 'MIXED GREEN SALAD WITH BARBERRY', price: 3.3, active: false, category_id: 1, created_at: Date.today - rand(10).days)
# MenuItem.create(title: 'CUCUMBER AND CHERRY TOMATO SALAD WITH WALNUTS', price: 3.3, active: false, category_id: 1, created_at: Date.today - rand(10).days)
# MenuItem.create(title: 'MIXED VEGETABLES WRAPPED IN SULGUNI CHEESE LAYERS', price: 4.2, active: true, category_id: 1, created_at: Date.today - rand(10).days)
# MenuItem.create(title: 'ROASTED QUAIL LEGS WITH BERRY SAUCE', price: 7, active: true, category_id: 1, created_at: Date.today - rand(10).days)
# MenuItem.create(title: '“CHIKHIRTMA”', price: 3.3, active: true, category_id: 1, created_at: Date.today - rand(10).days)
# MenuItem.create(title: 'GREEN BEANS WITH CHERRY TOMATO AND MINT', price: 4.1, active: true, category_id: 2, created_at: Date.today - rand(10).days)
# MenuItem.create(title: ' MIXED MUSHROOM STEW', price: 5.2, active: true, category_id: 2, created_at: Date.today - rand(10).days)
# MenuItem.create(title: '“KHARCHO”', price: 10, active: false, category_id: 2, created_at: Date.today - rand(10).days)
# MenuItem.create(title: 'PRAWN “KHARCHO” WITH COUSCOUS', price: 10.11, active: true, category_id: 2, created_at: Date.today - rand(10).days)
# MenuItem.create(title: 'COUSCOUS WITH VEGETABLES AND HERBS', price: 2.6, active: true, category_id: 1, created_at: Date.today - rand(10).days)
# MenuItem.create(title: 'HOME STYLE POTATOES WITH ONIONS AND GEORGIAN SPICES', price: 2.6, active: true, category_id: 1, created_at: Date.today - rand(10).days)
# MenuItem.create(title: 'SPINACH WITH GINGER AND WALNUTS', price: 2.6, active: true, category_id: 1, created_at: Date.today - rand(10).days)
# MenuItem.create(title: '“KHACHAPURI ADJARI“', price: 7, active: true, category_id: 2, created_at: Date.today - rand(10).days)
# MenuItem.create(title: 'HOMEMADE LEMONADE WITH SEASONAL FRUIT', price: 3, active: true, category_id: 3, created_at: Date.today - rand(10).days)
# MenuItem.create(title: 'TARRAGON', price: 3, active: true, category_id: 3, created_at: Date.today - rand(10).days)
# MenuItem.create(title: '“CHVANCHKARA” VINE', price: 15, active: true, category_id: 3, created_at: Date.today - rand(10).days)

# 18.times do |i|
#   ItemHistory.create(menu_item_id: "#{i+37}", price: MenuItem.find(i+37).price, active: MenuItem.find(i+37).active)
# end

# 10.times do |i|
#   User.create(email: "duser1#{i}@example.com",
#               name: Faker::Name.name,
#               phone: Faker::PhoneNumber.cell_phone,
#               password: "password",
#               password_confirmation: "password",
#               default_address: Faker::Address.full_address)
# end