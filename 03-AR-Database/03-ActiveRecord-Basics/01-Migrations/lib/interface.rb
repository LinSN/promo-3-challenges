require_relative 'config/application'

DB = ActiveRecord::Base.connection

def ask(prompt)
  print "#{prompt} "
  gets.to_s.chomp
end

def create_post
  name = ask('Name:')
  source_url = ask('Source url:')
  rating = ask('Rating:').to_i
  date = Time.now

  DB.execute("INSERT INTO posts(name, source_url, created_at, rating) VALUES ('#{name}', '#{source_url}', '#{date}', '#{rating}') ")
end

def get_posts
<<<<<<< HEAD
<<<<<<< HEAD
  posts = DB.execute("SELECT * FROM posts")
=======
  posts = DB.execute('TODO: write the SQL query to get all posts')
>>>>>>> ba5fc0ee5c682b443a140ff22922c4ab87066e78
=======
  posts = DB.execute('TODO: write the SQL query to get all posts')
>>>>>>> ba5fc0ee5c682b443a140ff22922c4ab87066e78

  puts '-' * 50
  puts '%-3s %-15s %-20s %-30s %s' % ['#', 'Name', 'Source URL', 'Created At', 'Rating']

  posts.each do |post|
    puts '%-3d %-15s %-20s %-30s %d' % [post['id'], post['name'], post['source_url'], post['created_at'], post['rating']]
  end

  puts '-' * 50
end

def delete_posts
  DB.execute("DELETE FROM posts")
  DB.execute("DELETE FROM SQLITE_SEQUENCE WHERE name='posts';")
end

while true
  puts 'Hey you, what do you want to do today? Enter <task_id>'
  puts '1. Create a post'
  puts '2. Read your posts'
  puts '3. Delete all posts'
  puts '4. Exit'

  case ask('>').to_i
  when 1 then create_post
  when 2 then get_posts
  when 3 then delete_posts
  when 4 then break
  end
end
