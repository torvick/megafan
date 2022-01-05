# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Role.create!(name: 'Admin', description: 'Admin complete', value: 0)
Role.create!(name: 'Client', description: 'Client', value: 1)
User.create!(email: 'admin@megafan.com',name: 'Admin', username: 'AA',last_name: 'Root',phone: '1234567890', role_id: 1, password: 'Fercho1$')
Country.create!(name: 'Mexico', description: '', short_name: 'MX', code: '240')
Country.create!(name: 'USA', description: '', short_name: 'US', code: '840')
Language.create!(name: 'Español', description: '', value: 'es')
Language.create!(name: 'Ingles', description: '', value: 'en')
Category.create!(name: 'Tecnologia', description: '', value: 'TC')
Ranking.create!(name: 'Ranking 1', description: '', value: '1')
Ranking.create!(name: 'Ranking 2', description: '', value: '2')
Ranking.create!(name: 'Ranking 3', description: '', value: '3')
Ranking.create!(name: 'Ranking 4', description: '', value: '4')
Ranking.create!(name: 'Ranking 5', description: '', value: '5')
Ranking.create!(name: 'Ranking 6', description: '', value: '6')
Ranking.create!(name: 'Ranking 7', description: '', value: '7')
Ranking.create!(name: 'Ranking 8', description: '', value: '8')
TypeBalance.create!(name: 'Money', description: '', value: '1')
TypeBalance.create!(name: 'Gems', description: '', value: '2')
TypeBalance.create!(name: 'Coins', description: '', value: '3')
