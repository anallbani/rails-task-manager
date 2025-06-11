# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Seeding example tasks..."

Task.find_or_create_by!(title: "Buy groceries") do |task|
  task.details = "Milk, bread and eggs"
  task.completed = false
end

Task.find_or_create_by!(title: "Workout") do |task|
  task.details = "Go for a 5km run"
  task.completed = true
end

Task.find_or_create_by!(title: "Read a book") do |task|
  task.details = "Finish reading the Rails tutorial"
  task.completed = false
end

puts "Tasks seeded."
