require_relative 'config/application'
require_relative 'models/post'
require_relative 'models/user'
require 'colorize'

<<<<<<< HEAD
User.where(name: "Nordine", email: "nono@nono.com").first_or_create

def ask(prompt)
  print "#{prompt} "
  gets.to_s.chomp
end

def create_post(user)
  p user.posts
  name = ask('Name:')
  source_url = ask('Source URL:')
  rating = ask('Rating:').to_i
  post_params = { name: name, source_url: source_url, date: Time.now, rating: rating }

  # TODO: use ActiveRecord to add a new post for the user logged in!

  user.posts.create(post_params)
end

def list_posts(user)
  # TODO: use ActiveRecord to get all posts of the current user
  posts = user.posts.all
  posts.each do |post|
    puts '%-3s %-15s %-20s %-30s %s' % [post.id.to_s.green, post.name, post.source_url, post.date, post.rating.to_s.red]
=======
def ask(prompt)
  print "#{prompt} "
  gets.to_s.chomp
end

def create_post(user)
  name = ask('Name:')
  source_url = ask('Source URL:')
  rating = ask('Rating:')
  post_params = { name: name, source_url: source_url, date: Time.now, rating: rating }

  # TODO: use ActiveRecord to add a new post for the user logged in!
end

def list_posts(user)
  # TODO: use ActiveRecord to get all posts of the current user
end

def delete_posts(user)
  # TODO: use ActiveRecord to delete all posts of current user
end

while true
  logged_in = false

  until logged_in
    puts 'Please login with your <id>'
    # TODO: instantiate a user with his <id>
>>>>>>> ba5fc0ee5c682b443a140ff22922c4ab87066e78
  end
end

def delete_posts(user)
  # TODO: use ActiveRecord to delete all posts of current user
  user.posts.delete_all
end

logged_in = false
until logged_in
  puts 'Please login with your <id>'
  # TODO: instantiate a user with his <id>
  id = gets.chomp
  user = User.find(id)

  logged_in = true

end

while logged_in

  puts "Hey #{user.name}, what do you want to do today? Enter <task_id>"
  puts "1. Create a post"
  puts "2. Read your posts"
  puts "3. Delete all posts"
  puts "4. Exit"

<<<<<<< HEAD
  case ask('>').to_i
=======
  case ask('>')
>>>>>>> ba5fc0ee5c682b443a140ff22922c4ab87066e78
  when 1 then create_post(user)
  when 2 then list_posts(user)
  when 3 then delete_posts(user)
  when 4 then break
  end
end
