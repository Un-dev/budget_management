# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.create(title: 'Transports')
Category.create(title: 'Nourriture')
Category.create(title: 'Loisirs')
Category.create(title: 'Tech gears')
Category.create(title: 'Vetements')
Category.create(title: 'Beauté')

Budget.create(starts_at: '01-01-2022', ends_at: '31-01-2022', monthly: true)
Budget.create(starts_at: '01-02-2022', ends_at: '31-02-2022', monthly: true)

Expense.create(date: DateTime.now, title: 'Essence', amount: 50, category: Category.first)