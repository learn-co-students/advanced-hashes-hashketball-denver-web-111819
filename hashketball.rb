require 'pry'

def game_hash
  {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => [
        {:player_name => "Alan Anderson",
        :number => 0,
        :shoe => 16,
        :points => 22,
        :rebounds => 12,
        :assists => 12,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 1},
        {:player_name => "Reggie Evans",
        :number => 30,
        :shoe => 14,
        :points => 12,
        :rebounds => 12,
        :assists => 12,
        :steals => 12,
        :blocks => 12,
        :slam_dunks => 7},
        {:player_name => "Brook Lopez",
        :number => 11,
        :shoe => 17,
        :points => 17,
        :rebounds => 19,
        :assists => 10,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 15},
        {:player_name => "Mason Plumlee",
        :number => 1,
        :shoe => 19,
        :points => 26,
        :rebounds => 11,
        :assists => 6,
        :steals => 3,
        :blocks => 8,
        :slam_dunks => 5},
        {:player_name => "Jason Terry",
        :number => 31,
        :shoe => 15,
        :points => 19,
        :rebounds => 2,
        :assists => 2,
        :steals => 4,
        :blocks => 11,
        :slam_dunks => 1}
        ]
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => [
        {:player_name => "Jeff Adrien",
        :number => 4,
        :shoe => 18,
        :points => 10,
        :rebounds => 1,
        :assists => 1,
        :steals => 2,
        :blocks => 7,
        :slam_dunks => 2},
        {:player_name => "Bismack Biyombo",
        :number => 0,
        :shoe => 16,
        :points => 12,
        :rebounds => 4,
        :assists => 7,
        :steals => 22,
        :blocks => 15,
        :slam_dunks => 10},
        {:player_name => "DeSagna Diop",
        :number => 2,
        :shoe => 14,
        :points => 24,
        :rebounds => 12,
        :assists => 12,
        :steals => 4,
        :blocks => 5,
        :slam_dunks => 5},
        {:player_name => "Ben Gordon",
        :number => 8,
        :shoe => 15,
        :points => 33,
        :rebounds => 3,
        :assists => 2,
        :steals => 1,
        :blocks => 1,
        :slam_dunks => 0},
        {:player_name => "Kemba Walker",
        :number => 33,
        :shoe => 15,
        :points => 6,
        :rebounds => 12,
        :assists => 12,
        :steals => 7,
        :blocks => 5,
        :slam_dunks => 12},
        ]
    }
  }
end

def num_points_scored(name)
  game_hash.each do |place, team_data|
    team_data.each do |attribute, info|
      if attribute == :players
        info.each do |player|
          if player[:player_name] == name
            return player[:points]
          end
        end
      end
    end
  end
end

def shoe_size(name)
  game_hash.each do |place, team_data|
    team_data.each do |attribute, info|
      if attribute == :players
        info.each do |player|
          if player[:player_name] == name
            return player[:shoe]
          end
        end
      end
    end
  end
end

def team_colors(team)
  game_hash.each do |place, team_data|
    if team_data[:team_name] == team
      return team_data[:colors]
    end
  end
end

def team_names
  names = []
  game_hash.each do |place, team_data|
    names << team_data[:team_name]
  end
  names
end

def player_numbers(team)
  numbers = []
  game_hash.each do |place, team_data|
    if team_data[:team_name] == team
      team_data.each do |attribute, info|
        if attribute == :players
          info.each do |player|
          numbers << player[:number]
        end
        end
      end
    end
  end
  numbers
end

def player_stats(name)
  stats = {}
  game_hash.each do |place, team_data|
    team_data.each do |attribute, info|
      if attribute == :players
        info.each do |player|
          if player[:player_name] == name
            stats = player.delete_if do |key, value|
              key == :player_name
            end
          end
        end
      end
    end
  end
  stats
end

def big_shoe_rebounds
  size = 0
  rebounds= 0
  game_hash.each do |place, team_data|
    team_data.each do |attribute, info|
      if attribute == :players
        info.each do |player|
          if player[:shoe] > size
            size = player[:shoe]
            rebounds = player[:rebounds]
          end
        end
      end
    end
  end
  rebounds
end

def most_points_scored
  points = 0 
  max_player = nil
  game_hash.each do |place, team_data|
    team_data.each do |attribute, info|
      if attribute == :players
        info.each do |player|
          if player[:points] > points 
            points = player[:points]
            max_player = player[:player_name]
          end
        end
      end
    end
  end
  max_player
end

def winning_team
  away_points = 0
  home_points = 0
  winner = nil
  game_hash[:away][:players].each do |player, stat|
    away_points += player[:points]
  end
  game_hash[:home][:players].each do |player, stat|
    home_points += player[:points]
  end
  if away_points > home_points
    winner = game_hash[:away][:team_name]
  elsif home_points > away_points
    winner = game_hash[:home][:team_name]
  end
  winner
end

def player_with_longest_name
  longest = 0 
  longest_name = nil
  game_hash.each do |place, team_data|
    team_data.each do |attribute, info|
      if attribute == :players
        info.each do |player|
          if player[:player_name].length > longest
            longest = player[:player_name].length
            longest_name = player[:player_name]
          end
        end
      end
    end
  end
  longest_name
end

def long_name_steals_a_ton?
  most_steals = 0
  most_steals_name = nil
  game_hash.each do |place, team_data|
    team_data.each do |attribute, info|
      if attribute == :players
        info.each do |player|
          if player[:steals] > most_steals
            most_steals = player[:steals]
            most_steals_name = player[:player_name]
          end
        end
      end
    end
  end
  most_steals_name == player_with_longest_name
end