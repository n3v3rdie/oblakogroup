# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#puts "Hello world"

seeds_file = Rails.root.join("db", "seeds.yml")
config = YAML::load_file(seeds_file)

config["projects"].each do |p|
  project = Project.create(title: p["title"])
  puts "Created #{project.title}"
  p["todos"].each do |t|
    todo = Todo.create(text: t["text"], isCompleted: t["isCompleted"], project: project)
    puts "Created todos #{todo.text} "
  end
end

