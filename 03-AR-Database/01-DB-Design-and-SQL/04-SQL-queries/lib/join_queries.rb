require 'sqlite3'

# opens the database
database_path = File.join(File.dirname(__FILE__), 'db/jukebox.sqlite')
db = SQLite3::Database.new(database_path)

def detailed_tracks(db)
  # TODO: return the list of tracks with their album and artist
  db.execute( "SELECT t.Name, ar.Name, al.Title FROM Track t, Artist ar, Album al WHERE t.AlbumId = al.AlbumId AND ar.ArtistId = al.ArtistId ;"  )
end

def stats_on(db, cat)
  #TODO: For the given category of music, return the number of tracks and the average song length (as a stats hash)
  array = db.execute("SELECT COUNT(*),AVG(t.Milliseconds)
              FROM Track t, Genre g
              WHERE t.GenreId = g.GenreId
              AND g.Name = '#{cat}'
              GROUP BY g.Name;"  ).flatten
  array[1] = array[1]/60/10**3

  ruby = {
    category: cat,
    number_of_songs: array[0],
    avg_length: array[1]
  }

  ruby
end

def top_five_rock_artists(db)
  #TODO: return list of top 5 rock artists
  db.execute("SELECT ar.Name,COUNT(*) as c
              FROM Track t, Genre g, Artist ar, Album al
              WHERE t.GenreId = g.GenreId
              AND t.AlbumId = al.AlbumId
              AND al.ArtistId = ar.ArtistId
              AND g.Name = 'Rock'
              GROUP BY ar.Name
              ORDER BY c DESC
              LIMIT 5;"  ).to_h
end

detailed_tracks(db)
stats_on(db, "Latin")
p top_five_rock_artists(db)