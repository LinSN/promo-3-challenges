require 'sqlite3'

def create_scheme(db)
  #TODO: create your db scheme
  sql = %q{ CREATE TABLE posts
    (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name VARCHAR(100),
      source_url VARCHAR (500),
      date DATE,
      rating INTEGER
    )
  }  # %q allows for multiline string in ruby
  db.execute(sql)
end

def create_post(db, post)
  #TODO: add a new post to your db
  db.execute("INSERT INTO posts (name, source_url, date, rating)
              VALUES ('#{post[:name]}', '#{post[:source_url]}', '#{post[:date]}', #{post[:rating]})")
end

def get_posts(db)
   #TODO: list all posts
    db.execute("SELECT * FROM posts").each do |row|
      puts "id: #{row[0]} - name: #{row[1]} - URL: #{row[2]} - Date: #{row[3]} - Rate: #{row[4]} "
    end
end

def get_post(db, id)
  #TODO: get a specific post
  db.execute("SELECT * FROM posts WHERE id = #{id}").each do |row|
      puts "id: #{row[0]} - name: #{row[1]} - URL: #{row[2]} - Date: #{row[3]} - Rate: #{row[4]} "
    end
end

def update_post(db, id, new_name)
	#TODO: update a post's name in your db
  db.execute("UPDATE posts
              SET name = '#{new_name}'
              WHERE id = #{id}")
end

def delete_posts(db)
  #TODO: delete a post in your db
  db.execute("DELETE FROM posts")
  db.execute("DELETE FROM SQLITE_SEQUENCE WHERE name='posts';")
end

def delete_post(db, id)
  #TODO: delete a specific post in your db
  db.execute("DELETE FROM posts WHERE id = #{id}")
end