# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "faker"

p Calendar.create(tag: "Work")
p Calendar.create(tag: "Side Projects")

def create_event
    number = rand(0..5)
    start_time = Time.now+number.day+number.hour
    end_time = start_time+1.hour
    p Event.create(title: "#{Faker::Company.name}#{Faker::Company.suffix}", description: Faker::Company.bs , location: Faker::Address.full_address, tag:"appointment", calendar_id:1, starttime: start_time, endtime: end_time)
end

12.times do
    create_event
end