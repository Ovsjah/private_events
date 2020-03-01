# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(name: 'Stinky Wizzleteats', email: 'stinky@outlook.com', password: 'HelloWorld', password_confirmation: 'HelloWorld')
stinky = User.find_by_email('stinky@outlook.com')
event_descriptions = [
  'Born to be wild', 'Baby light my fire',
  'Paint in black, what a heck', 'Like on Discovery channel',
  'Happy, happy, joy, joy', "You'll never walk alone"
]
Event.insert_all(
  event_descriptions.map do |desc|
    {user_id: stinky.id,
     description: desc,
     date: rand(13.days).seconds.from_now,
     created_at: Time.now,
     updated_at: Time.now}
  end
)
