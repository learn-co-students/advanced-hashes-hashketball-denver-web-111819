def game_hash()
  {
    :home => {
      :team_name => "Brooklyn Nets", 
      :colors => ["Black", "White"], 
      :players => [
        {
          :player_name => "Alan Anderson",
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1, 
          :slam_dunks => 1
        },
        {
          :player_name => "Reggie Evans",
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12, 
          :slam_dunks => 7
        },
        {
          :player_name => "Brook Lopez",
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1, 
          :slam_dunks => 15
        },
        {
          :player_name => "Mason Plumlee",
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 11,
          :assists => 6,
          :steals => 3,
          :blocks => 8, 
          :slam_dunks => 5
        },
        {
          :player_name => "Jason Terry",
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11, 
          :slam_dunks => 1
        }
      ]
    }, 
    :away => {
      :team_name => "Charlotte Hornets", 
      :colors => ["Turquoise", "Purple"], 
      :players => [
        {
          :player_name => "Jeff Adrien",
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7, 
          :slam_dunks => 2
        },
         {
          :player_name => "Bismack Biyombo",
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 22,
          :blocks => 15, 
          :slam_dunks => 10
        },
         {
          :player_name => "DeSagna Diop",
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5, 
          :slam_dunks => 5
        },
         {
          :player_name => "Ben Gordon",
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1, 
          :slam_dunks => 0
        },
         {
          :player_name => "Kemba Walker",
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 7,
          :blocks => 5, 
          :slam_dunks => 12
        }
      ]
    }
  }
end

def num_points_scored(name)
  new_hash = game_hash()
  home_team = new_hash[:home][:players]
  away_team = new_hash[:away][:players]
  players = home_team + away_team
  players.each do |player|
    if player[:player_name] ==  name
      return player[:points]
    end  
  end  
end

def shoe_size(name)
  new_hash = game_hash()
  home_team = new_hash[:home][:players]
  away_team = new_hash[:away][:players]
  players = home_team + away_team
  players.each do |player|
    if player[:player_name] ==  name
      return player[:shoe]
    end  
  end
end  

def team_colors(name)
  new_hash = game_hash()
  home_team = new_hash[:home][:team_name]
  away_team = new_hash[:away][:team_name]
  if home_team == name
    return new_hash[:home][:colors]
  elsif away_team == name
    return new_hash[:away][:colors]
  end
end  

def team_names()
  new_hash = game_hash()
  [new_hash[:home][:team_name], new_hash[:away][:team_name]]
end  

def player_numbers(name)
  new_hash = game_hash()
  if new_hash[:home][:team_name] == name
    new_hash[:home][:players].map {|player| player[:number]}
  elsif new_hash[:away][:team_name] == name
    new_hash[:away][:players].map {|player| player[:number]}
  end
end  

def player_stats(name)
  new_hash = game_hash()
  home_team = new_hash[:home][:players]
  away_team = new_hash[:away][:players]
  players = home_team + away_team
  players.each do |player|
    if player[:player_name] ==  name
      player_copy = player.clone 
      player_copy.delete(:player_name)
      return player_copy
    end  
  end
end  

def big_shoe_rebounds()
  new_hash = game_hash()
  home_team = new_hash[:home][:players]
  away_team = new_hash[:away][:players]
  players = home_team + away_team
  player = players.max {|a,b| a[:shoe]<=>b[:shoe]}
  player[:rebounds]
end  

def most_points_scored()
  new_hash = game_hash()
  home_team = new_hash[:home][:players]
  away_team = new_hash[:away][:players]
  players = home_team + away_team
  player = players.max {|a,b| a[:points]<=>b[:points]}
  player[:player_name]
end

def winning_team()
  new_hash = game_hash()
  total_home_points = new_hash[:home][:players]        .sum{|player| player[:points]}
  total_away_points = new_hash[:away][:players]
    .sum{|player| player[:points]}
  if total_home_points > total_away_points
    new_hash[:home][:team_name]
  else 
    new_hash[:away][:team_name]  
  end  
end  

def player_with_longest_name()
  new_hash = game_hash()
  home_team = new_hash[:home][:players]
  away_team = new_hash[:away][:players]
  players = home_team + away_team
  player = players.max {|a,b| a[:player_name].length<=>b[:player_name].length}
  player[:player_name]
end

def player_with_most_steals()
  new_hash = game_hash()
  home_team = new_hash[:home][:players]
  away_team = new_hash[:away][:players]
  players = home_team + away_team
  player = players.max {|a,b| a[:steals]<=>b[:steals]}
  player[:player_name]
end  

def long_name_steals_a_ton?()
  player_with_longest_name() == player_with_most_steals()
end  
  
  