require 'open-uri'
require 'json'

def generate_grid(grid_size)
  my_grid = []
  while my_grid.size < grid_size
    my_grid << ('A'..'Z').to_a[rand(26)]
  end
  my_grid
end

def run_game(attempt, grid, start_time, end_time)
  api_url = "http://api.wordreference.com/0.8/80143/json/enfr/#{attempt}"
  data = {}
  attempt = attempt

  open(api_url) do |stream|
    data = JSON.parse(stream.read)
    if data["Error"] == "NoTranslation"
      result = {
        translation: nil,
        time: (end_time - start_time),
        score: 0,
        message: "not an english word"
      }

    elsif attempt_is_on_the_grid?(attempt,grid)
        result = {
          translation: data["term0"]["PrincipalTranslations"]["0"]["FirstTranslation"]["term"],
          time: (end_time - start_time),
          score: (attempt.size*10) / (end_time - start_time),
          message: "well done"
        }
    else
        result = {
          translation: nil,
          time: (end_time - start_time),
          score: 0,
          message: "not in the grid"
        }
    end
  end
  #TODO: runs the game and return detailed hash of result
end

def attempt_is_on_the_grid?(attempt,grid)
  tab_bool = []
  attempt = attempt.upcase.split("")
  attempt.each do |attemp_letter|
    if grid.include? attemp_letter
      tab_bool << true
    else
      tab_bool << false
    end
  end
  puts tab_bool
  if tab_bool.count(true) == attempt.size
    true
  else
    false
  end
end

