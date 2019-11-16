def game_hash 
  {:home => {:team_name => "Brooklyn Nets", :colors => ["Black", "White"], :players => [{:player_name => "Alan Anderson", :number => 0, :shoe => 16, :points => 22, :rebounds => 12, :assists => 12, :steals => 3, :blocks => 1, :slam_dunks => 1},{:player_name => "Reggie Evans", :number => 30, :shoe => 14, :points => 12, :rebounds => 12, :assists => 12, :steals => 12, :blocks => 12, :slam_dunks => 7}, {:player_name => "Brook Lopez", :number => 11, :shoe => 17, :points => 17, :rebounds => 19, :assists => 10, :steals => 3, :blocks => 1, :slam_dunks => 15}, {:player_name => "Mason Plumlee", :number => 1, :shoe => 19, :points => 26, :rebounds => 11, :assists => 6, :steals => 3, :blocks => 8, :slam_dunks => 5}, {:player_name => "Jason Terry", :number => 31, :shoe => 15, :points => 19, :rebounds => 2, :assists => 2, :steals => 4, :blocks => 11, :slam_dunks => 1}]}, 
  :away => {:team_name => "Charlotte Hornets", :colors => ["Turquoise", "Purple"], :players => [{:player_name => "Jeff Adrien", :number => 4, :shoe => 18, :points => 10, :rebounds => 1, :assists => 1, :steals => 2, :blocks => 7, :slam_dunks => 2},{:player_name => "Bismack Biyombo", :number => 0, :shoe => 16, :points => 12, :rebounds => 4, :assists => 7, :steals => 22, :blocks => 15, :slam_dunks => 10}, {:player_name => "DeSagna Diop", :number => 2, :shoe => 14, :points => 24, :rebounds => 12, :assists => 12, :steals => 4, :blocks => 5, :slam_dunks => 5}, {:player_name => "Ben Gordon", :number => 8, :shoe => 15, :points => 33, :rebounds => 3, :assists => 2, :steals => 1, :blocks => 1, :slam_dunks => 0}, {:player_name => "Kemba Walker", :number => 33, :shoe => 15, :points => 6, :rebounds => 12, :assists => 12, :steals => 7, :blocks => 5, :slam_dunks => 12}]}}
end

def num_points_scored(player_name)
  points = game_hash.map{|x, y| y}
  points.each{|z| z[:players].each{|q| q[:player_name] == player_name ? (return q[:points]) : nil}}
end

def shoe_size(player_name)
  points = game_hash.map{|x, y| y}
  points.each{|z| z[:players].each{|q| q[:player_name] == player_name ? (return q[:shoe]) : nil}}
end

def team_colors(team_name)
  points = game_hash.map{|x, y| y}
  points.each{|z| z[:team_name] == team_name ? (return z[:colors]) : nil}
end

def team_names
  points = game_hash.map{|x, y| y[:team_name]}
end 

def player_numbers(team_name)
  points = []
  game_hash.map{|x, y| y[:team_name] == team_name ? y[:players].map{|g| points.push (g[:number])} : nil }
  points
end

def player_stats(player_name)
  points = game_hash.map{|x, y| y}
  points.each{|z| z[:players].each do |q| 
    if q[:player_name] == player_name 
      q.delete(:player_name)
      return q
    end
  end
  }
end

def big_shoe_rebounds
  int_rebounds = 0 
  int_shoe = 0
  points = game_hash.map{|x, y| y[:players]}
  points.each{|z| z.each do |h| 
    if shoe_size(h[:player_name]) > int_shoe 
        int_rebounds = h[:rebounds] 
        int_shoe = shoe_size(h[:player_name])
      end
    end
  }
  int_rebounds
end

def most_points_scored
  int_score = 0
  name_str = ""
  points = game_hash.map{|x, y| y[:players]}
  points.each{|z| z.each do |h| 
    if num_points_scored(h[:player_name]) > int_score 
        int_score = h[:points]
        name_str = h[:player_name]
      end
    end
  }
  name_str
end

def winning_team 
  scoreA = 0
  scoreB = 0
  points = game_hash.map{|x, y| y}
  points.each{|z| z[:players].each do |h|
    if z[:team_name] == "Brooklyn Nets" 
      scoreA = h[:points] 
    else
      scoreB = h[:points]
    end
  end
  }
  if scoreA > scoreB 
    return "Brooklyn Nets"
  else 
    return "Charlotte Hornets"
  end
end

def player_with_longest_name
  name = ""
  length = 0
  points = game_hash.map{|x, y| y[:players].map{|t| t[:player_name]}}
  points.each do |u| 
    u.each do |f|
      if f.length > length 
        length = f.length
        name = f
      end
      end
    end
 name
end

def long_name_steals_a_ton?
  int_score = 0
  name_str = ""
  points = game_hash.map{|x, y| y[:players]}
  points.each{|z| z.each do |h| 
    if h[:steals] > int_score 
        int_score = h[:steals]
        name_str = h[:player_name]
      end
    end
  }
  if player_with_longest_name == name_str
    return TRUE
  else
    return FALSE
  end
end