def game_hash
  {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => [
        {:player_name => "Alan Anderson", :number => 0, :shoe => 16, :points => 22, :rebounds => 12, :assists => 12, :steals => 3, :blocks => 1, :slam_dunks => 1},
        {:player_name => "Reggie Evans", :number => 30, :shoe => 14, :points => 12, :rebounds => 12, :assists => 12, :steals => 12, :blocks => 12, :slam_dunks => 7},
        {:player_name => "Brook Lopez", :number => 11, :shoe => 17, :points => 17, :rebounds => 19, :assists => 10, :steals => 3, :blocks => 1, :slam_dunks => 15},
        {:player_name => "Mason Plumlee", :number =>1, :shoe => 19, :points => 26, :rebounds => 11, :assists => 6, :steals => 3, :blocks => 8, :slam_dunks => 5},
        {:player_name => "Jason Terry", :number => 31, :shoe => 15, :points => 19, :rebounds => 2, :assists => 2, :steals => 4, :blocks => 11, :slam_dunks => 1},
        ]
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => [
        {:player_name => "Jeff Adrien", :number => 4, :shoe => 18, :points => 10, :rebounds => 1, :assists => 1, :steals => 2, :blocks => 7, :slam_dunks => 2},
        {:player_name => "Bismack Biyombo", :number => 0, :shoe => 16, :points => 12, :rebounds => 4, :assists => 7, :steals => 22, :blocks => 15, :slam_dunks => 10},
        {:player_name => "DeSagna Diop", :number => 2, :shoe => 14, :points => 24, :rebounds => 12, :assists => 12, :steals => 4, :blocks => 5, :slam_dunks => 5},
        {:player_name => "Ben Gordon", :number => 8, :shoe => 15, :points => 33, :rebounds => 3, :assists => 2, :steals => 1, :blocks => 1, :slam_dunks => 0},
        {:player_name => "Kemba Walker", :number => 33, :shoe => 15, :points => 6, :rebounds => 12, :assists => 12, :steals => 7, :blocks => 5, :slam_dunks => 12}
        ]
    }
  }
end


def num_points_scored(name)
  data = game_hash
  
  data.reduce({}) do |memo, (team,value)|
    value[:players].reduce({}) do |memo, (player, info)|
      
      if player[:player_name] == name
       return player[:points]
      end
    end
  end
end


def shoe_size(name)
 data = game_hash
  
  data.reduce({}) do |memo, (team,value)|
    value[:players].reduce({}) do |memo, (player, info)|
      
      if player[:player_name] == name
       return player[:shoe]
      end
    end
  end
end

def team_colors (name)
  data = game_hash
  
  data.reduce({}) do |memo, (team, value)|
    if value[:team_name] == name
      return value[:colors]
    end
  end
end

def team_names
  data = game_hash
  team_hash = []
  
  data.reduce({}) do |memo, (team, value)|
   team_hash.push(value[:team_name])
  end
  team_hash
end

def player_numbers(team_name)
  data = game_hash
  jersey_array = []
  
  data.reduce({}) do |memo, (team,value)|
    if value[:team_name] == team_name
      value[:players].each do |number|
        jersey_array.push(number[:number])
      end
    end
  end
  jersey_array
end


def player_stats(name)
  data = game_hash
  
  data.reduce({}) do |memo, (team,value)|
    value[:players].reduce({}) do |memo, (player, info)|
      
      if player[:player_name] == name
        player.delete(:player_name)
       return player
      end
    end
  end
end


def big_shoe_rebounds
  data = game_hash
  
  biggest_shoe = 0
  rebounds = 0
  
  data.reduce ({}) do |memo, (team, value)|
    value[:players].reduce({}) do |memo, (player, info)|
      
      if player[:shoe] > biggest_shoe
        biggest_shoe = player[:shoe]
        rebounds = player[:rebounds]
        
      end
    end
  end
  return rebounds
end


def most_points_scored
  data = game_hash
  
  points_scored = 0
  name = ""
  
  data.reduce ({}) do |memo, (team, value)|
    value[:players].reduce({}) do |memo, (player, info)|
      
      if player[:points] > points_scored
        points_scored = player[:points]
        name = player[:player_name]
        
      end
    end
  end
  return name
end


def winning_team
  data = game_hash
  
  team_1_points = 0
  team_1_name = n""
  team_2_points = 0
  team_2_name = ""
  
  data.reduce ({}) do |memo, (team, value)|
    value[:players].reduce({}) do |memo, (player, info)|
      
    team_1_name = value[:team_name] if team_1_name = ""
    team_2_name = value[:team_name] if value[:team_name] != team_1_name 
    
    if value[:team_name] = team_1_name
      team_1_points += value[:points]
    else 
      team_2_points += value[:points]
    end
    end
  end
  if team_1_points > team_2_points
    return team_1_name
  else 
    reurn team_2_name
  end
end



