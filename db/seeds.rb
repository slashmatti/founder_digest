# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "RUNNING SEEDS..."
user_count = User.count

def websites
    %w(ryanckulp.com csell.co pictureit.co forkequity.com google.com uber.com)
end

def setup_fake_data!
    user = User.create!(email: Faker::Internet.email, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, password: 'password')
    project = user.projects.create!(title: "#{Faker::Company.name} newsletter", description: Faker::Company.catch_phrase, website: websites.sample)
    project.stakeholder_updates.create!(title: Faker::Company.bs, content: Faker::Company.catch_phrase)
end

15.times do
    setup_fake_data!
end

new_user_count = User.count - user_count
puts "CREATED #{new_user_count} USERS."
