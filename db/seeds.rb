# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'faker'


Event.destroy_all
User.destroy_all
Attendance.destroy_all



10.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name

  u = User.create(
      first_name: first_name,
      last_name: last_name,
      description:Faker::Lorem.paragraph,
      email: "#{first_name.downcase}.#{last_name.downcase}@yopmail.com", 
      encrypted_password:"Blabla01!"
    )

end



french_cities_array = ["Paris", "Lyon", "Marseille", "Toulouse", "Montpellier", "Bordeaux"]

30.times do
  e = Event.create(
    start_date:Faker::Time.forward(days: 90, period: :day),
    duration: (5 * rand(5800)),
    title:Faker::Book.title, 
    description:Faker::Lorem.paragraph,
    price: rand(1000),
    location: french_cities_array.sample,
    admin_id: User.all.sample.id
  )

  e.save

  puts e
  puts e.start_date
  puts e.duration
  puts e.title
  puts e.description
  puts e.price
  puts e.location
  puts e.admin_id
  puts "###############################"

end

puts "CITY:"
puts Event.first
puts "_____________________________________"
puts "USER:"
puts User.all.sample.id
puts "##############################################"




Event.all.each do |event|
  3.times do
    Attendance.create(
      event_id: event.id,
      participant_id: User.all.sample.id
    )
  end
end