require 'pry'

def game_hash 
  {
  :home => {
    :team_name => "Brooklyn Nets",
    :colors => ["Black", "White"],
    :players => [
    { :player_name => "Alan Anderson",
      :number => 0,
      :shoe => 16,
      :points => 22,
      :rebounds => 12,
      :assists => 12,
      :steals => 3,
      :blocks => 1,
      :slam_dunks => 1
    }, 
    { :player_name => "Reggie Evans",
      :number => 30,
      :shoe => 14,
      :points => 12,
      :rebounds => 12,
      :assists => 12,
      :steals => 12,
      :blocks => 12,
      :slam_dunks => 7
    },
    { :player_name => "Brook Lopez",
      :number => 11,
      :shoe => 17,
      :points => 17,
      :rebounds => 19,
      :assists => 10,
      :steals => 3,
      :blocks => 1,
      :slam_dunks => 15
    },
    { :player_name => "Mason Plumlee",
      :number => 1,
      :shoe => 19,
      :points => 26,
      :rebounds => 11,
      :assists => 6,
      :steals => 3,
      :blocks => 8,
      :slam_dunks => 5
      
    },
    { :player_name => "Jason Terry",
      :number => 31,
      :shoe => 15,
      :points => 19,
      :rebounds => 2,
      :assists => 2,
      :steals => 4,
      :blocks => 11,
      :slam_dunks => 1
      
    }]
  },
  :away => {
    :team_name => "Charlotte Hornets",
    :colors => ["Turquoise", "Purple"],
    :players => [
    { :player_name => "Jeff Adrien",
      :number => 4,
      :shoe => 18,
      :points => 10,
      :rebounds => 1,
      :assists => 1,
      :steals => 2,
      :blocks => 7,
      :slam_dunks => 2
    }, 
    { :player_name => "Bismack Biyombo",
      :number => 0,
      :shoe => 16,
      :points => 12,
      :rebounds => 4,
      :assists => 7,
      :steals => 22,
      :blocks => 15,
      :slam_dunks => 10
    },
    { :player_name => "DeSagna Diop",
      :number => 2,
      :shoe => 14,
      :points => 24,
      :rebounds => 12,
      :assists => 12,
      :steals => 4,
      :blocks => 5,
      :slam_dunks => 5
    },
    { :player_name => "Ben Gordon",
      :number => 8,
      :shoe => 15,
      :points => 33,
      :rebounds => 3,
      :assists => 2,
      :steals => 1,
      :blocks => 1,
      :slam_dunks => 0
    },
    { :player_name => "Kemba Walker",
      :number => 33,
      :shoe => 15,
      :points => 6,
      :rebounds => 12,
      :assists => 12,
      :steals => 7,
      :blocks => 5,
      :slam_dunks => 12
    }]
   }
  }
end

def num_points_scored(players_name)
  #return number of points for player passed in
  game_hash.each do |place, team|
    team.each do |attribute, data|
      if attribute == :players
        data.each do |player|
          if player[:player_name] == players_name
            return player[:points]
          end
        end
      end
    end
  end
end

def shoe_size(players_name)
  #returns shoe size for player passed in
  game_hash.each do |place, team|
    team.each do |attribute, data|
      if attribute == :players
        data.each do |player|
          if player[:player_name] == players_name
            return player[:shoe]
          end
        end
      end
    end
  end
end

def team_colors(team_name)
  #returns an array of that team's colors
  game_hash.each do |place, team|
    if team[:team_name] == team_name
      return team[:colors]
    end
  end
end

def team_names
  #returns an array of the team names
  game_hash.map do |place, team|
    team[:team_name]
  end
end

def player_numbers(team_name)
  #returns array of the jersey numbers for that team
  nums = []
  game_hash.each do |place, team|
    if team[:team_name] == team_name
      team.each do |attributes, data|
        if attributes == :players
          data.each do |player|
            nums << player[:number]
          end
        end
      end
    end
  end
  nums
end

def player_stats(players_name)
  #returns hash of that players stats
  new_hash = {}
  game_hash.each do |place, team|
    team.each do |attributes, data|
      if attributes == :players
        data.each do |player|
          if player[:player_name] == players_name
            new_hash = player.delete_if do |k, v|
              k === :player_name
            end
          end
        end
      end
    end
  end
  new_hash
end

def big_shoe_rebounds
  #returns number of rebounds associsated with the player that has the largest shoe size
  #1st find player with largest shoe size
  #2nd return that players number of rebounds
  shoe_size = 0
  rebound_num = 0
  game_hash.each do |place, team|
    team[:players].each do |player_name|
      if player_name[:shoe] > shoe_size
      shoe_size = player_name[:shoe]
      rebound_num = player_name[:rebounds]
      end
    end
  end
  rebound_num
end

def most_points_scored
  high_score = 0
  player = ""
  game_hash.values.each do |team|
    team[:players].each do |pointer|
      if pointer[:points] > high_score
      high_score = pointer[:points]
      player = pointer[:player_name]
      end
    end
  end
  return player
end

def winning_team
   winner = {}
  game_hash.values.each do |team_info|
    team_points = 0
    team_info[:players].each do |player|
      team_points += player[:points]
    end
    winner[team_info[:team_name]] = team_points
  end
  winner.key(winner.values.max) 
end

def player_with_longest_name
  longest_name = []
  game_hash.values.each do |team|
    team[:players].each do |player|
      longest_name << player[:player_name]
    end
  end
  longest_name.max_by do |name| 
    name.length
  end
end

def long_name_steals_a_ton?
  longest_steals = {}
  game_hash.values.each do |team|
    team[:players].each do |player|
      player[:steals] = longest_steals[player[:player_name]]
  end
end
  steals = longest_steals.values.max
  longest_steals[longest_steals.key(steals)] == steals
end