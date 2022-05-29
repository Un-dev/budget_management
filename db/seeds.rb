# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or create!d alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create!([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create!(name: 'Luke', movie: movies.first)

Category.create!(
  title: 'Transports',
  hex_color: '#B87DF2',
  icon:
    '<svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path d="M9 17a2 2 0 11-4 0 2 2 0 014 0zM19 17a2 2 0 11-4 0 2 2 0 014 0z" /><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 16V6a1 1 0 00-1-1H4a1 1 0 00-1 1v10a1 1 0 001 1h1m8-1a1 1 0 01-1 1H9m4-1V8a1 1 0 011-1h2.586a1 1 0 01.707.293l3.414 3.414a1 1 0 01.293.707V16a1 1 0 01-1 1h-1m-6-1a1 1 0 001 1h1M5 17a2 2 0 104 0m-4 0a2 2 0 114 0m6 0a2 2 0 104 0m-4 0a2 2 0 114 0" /></svg>',
)
Category.create!(
  title: 'Nourriture',
  hex_color: '#F28900',
  icon:
    '<svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 15.546c-.523 0-1.046.151-1.5.454a2.704 2.704 0 01-3 0 2.704 2.704 0 00-3 0 2.704 2.704 0 01-3 0 2.704 2.704 0 00-3 0 2.704 2.704 0 01-3 0 2.701 2.701 0 00-1.5-.454M9 6v2m3-2v2m3-2v2M9 3h.01M12 3h.01M15 3h.01M21 21v-7a2 2 0 00-2-2H5a2 2 0 00-2 2v7h18zm-3-9v-2a2 2 0 00-2-2H8a2 2 0 00-2 2v2h12z" /></svg>',
)
Category.create!(
  title: 'Loisirs',
  hex_color: '#7C49C8',
  icon:
    '<svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 4v16M17 4v16M3 8h4m10 0h4M3 12h18M3 16h4m10 0h4M4 20h16a1 1 0 001-1V5a1 1 0 00-1-1H4a1 1 0 00-1 1v14a1 1 0 001 1z" /></svg>',
)
Category.create!(
  title: 'Tech gears',
  hex_color: '#848D8F',
  icon:
    '<svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 18h.01M8 21h8a2 2 0 002-2V5a2 2 0 00-2-2H8a2 2 0 00-2 2v14a2 2 0 002 2z" /></svg>',
)
Category.create!(title: 'Vetements', hex_color: '#E22F3A')
Category.create!(title: 'Beauté', hex_color: '#F27EB8')
Category.create!(
  title: 'Salaire',
  hex_color: '#96DBE3',
  icon:
    '<svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8c-1.657 0-3 .895-3 2s1.343 2 3 2 3 .895 3 2-1.343 2-3 2m0-8c1.11 0 2.08.402 2.599 1M12 8V7m0 1v8m0 0v1m0-1c-1.11 0-2.08-.402-2.599-1M21 12a9 9 0 11-18 0 9 9 0 0118 0z" /></svg>',
)

user =
  User.create!(
    email: 'toto@toto.com',
    password: 'tototo',
    name: 'titi',
    surname: 'toto',
  )
Budget.create!(
  user: user,
  starts_at: '01-01-2022',
  ends_at: '31-01-2022',
  target_amount: 25,
  monthly: true,
  category: Category.first,
)
Budget.create!(
  user: user,
  starts_at: '01-02-2022',
  ends_at: '28-02-2022',
  target_amount: 30,
  monthly: true,
  category: Category.third,
)
Budget.create!(
  user: user,
  starts_at: '01-03-2022',
  ends_at: '31-03-2022',
  target_amount: 60,
  monthly: true,
  category: Category.second,
)
Budget.create!(
  user: user,
  starts_at: Time.now.at_beginning_of_month,
  ends_at: Time.now.at_end_of_month,
  target_amount: 110,
  monthly: true,
  category: Category.fourth,
)

Account.create!(user: user, balance: 500, title: 'Principal')
Account.create!(user: user, balance: 2300, title: 'Livret A')
Account.create!(user: user, balance: 6000, title: 'Plan épargne logement')
Expense.create!(
  date: DateTime.now,
  title: 'Essence',
  amount: -30,
  category: Category.first,
  account: user.accounts.first,
)
Expense.create!(
  date: DateTime.now,
  title: 'Macdo',
  amount: -10,
  category: Category.second,
  account: user.accounts.first,
)
Expense.create!(
  date: DateTime.now,
  title: 'Escape Game',
  amount: -20,
  category: Category.find_by(title: 'Loisirs'),
  account: user.accounts.first,
)
Expense.create!(
  date: DateTime.now,
  title: 'Salaire',
  amount: 1200,
  category: Category.last,
  account: user.accounts.first,
)
Expense.create!(
  date: DateTime.now,
  title: 'Cinéma',
  amount: -10,
  category: Category.find_by(title: 'Loisirs'),
  account: user.accounts.first,
)
Expense.create!(
  date: DateTime.now,
  title: 'Théâtre',
  amount: -15,
  category: Category.find_by(title: 'Loisirs'),
  account: user.accounts.first,
)
Expense.create!(
  date: DateTime.now,
  title: 'Salaire',
  amount: 1200,
  category: Category.last,
  account: user.accounts.first,
)
Expense.create!(
  date: DateTime.now,
  title: 'Macdo',
  amount: -10,
  category: Category.second,
  account: user.accounts.first,
)
