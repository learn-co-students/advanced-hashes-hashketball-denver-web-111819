require 'pp'

def game_hash
  {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => [{
        :player_name => "Alan Anderson",
        :number => 0,
        :shoe => 16,
        :points => 22,
        :rebounds => 12,
        :assists => 12,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 1
        },{
        :player_name => "Reggie Evans",
        :number => 30,
        :shoe => 14,
        :points => 12,
        :rebounds => 12,
        :assists => 12,
        :steals => 12,
        :blocks => 12,
        :slam_dunks => 7
        },{
        :player_name => "Brook Lopez",
        :number => 11,
        :shoe => 17,
        :points => 17,
        :rebounds => 19,
        :assists => 10,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 15
        },{
        :player_name => "Mason Plumlee",
        :number => 1,
        :shoe => 19,
        :points => 26,
        :rebounds => 11,
        :assists => 6,
        :steals => 3,
        :blocks => 8,
        :slam_dunks => 5
        },{
        :player_name => "Jason Terry",
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
      :players => [{
        :player_name => "Jeff Adrien",
        :number => 4,
        :shoe => 18,
        :points => 10,
        :rebounds => 1,
        :assists => 1,
        :steals => 2,
        :blocks => 7,
        :slam_dunks => 2
        },{
        :player_name => "Bismack Biyombo",
        :number => 0,
        :shoe => 16,
        :points => 12,
        :rebounds => 4,
        :assists => 7,
        :steals => 22,
        :blocks => 15,
        :slam_dunks => 10
        },{
        :player_name => "DeSagna Diop",
        :number => 2,
        :shoe => 14,
        :points => 24,
        :rebounds => 12,
        :assists => 12,
        :steals => 4,
        :blocks => 5,
        :slam_dunks => 5
        },{
        :player_name => "Ben Gordon",
        :number => 8,
        :shoe => 15,
        :points => 33,
        :rebounds => 3,
        :assists => 2,
        :steals => 1,
        :blocks => 1,
        :slam_dunks => 0
        },{
        :player_name => "Kemba Walker",
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

def num_points_scored(player_search)
  rosters = game_hash
  
  rosters.each do |team, value|
    rosters[team][:players].length.times do |player|
      if rosters[team][:players][player][:player_name] == player_search
        return rosters[team][:players][player][:points]
      end
    end
  end
end

def shoe_size(player_search)
  rosters = game_hash
  
  rosters.each do |team, value|
    rosters[team][:players].length.times do |player|
      if rosters[team][:players][player][:player_name] == player_search
        return rosters[team][:players][player][:shoe]
      end
    end
  end
end

def team_colors(team_search)
  rosters = game_hash
  
  rosters.each do |team, value|
    if rosters[team][:team_name] == team_search
      return rosters[team][:colors]
    end
  end
end

def team_names
  rosters = game_hash
  output = []
  
  rosters.each do |team, value|
    output.push(rosters[team][:team_name])
  end
  
  output
end

def player_numbers(team_search)
  rosters = game_hash
  output = []
  
  rosters.each do |team, value|
    if rosters[team][:team_name] == team_search
      rosters[team][:players].length.times do |player|
        output.push(rosters[team][:players][player][:number])
      end
    end
  end
  
  output
end

def player_stats(player_search)
  rosters = game_hash
  
  rosters.each do |team, value|
    rosters[team][:players].length.times do |player|
      if rosters[team][:players][player][:player_name] == player_search
        return {
          :assists => rosters[team][:players][player][:assists],
          :blocks => rosters[team][:players][player][:blocks],
          :number => rosters[team][:players][player][:number],
          :points => rosters[team][:players][player][:points],
          :rebounds => rosters[team][:players][player][:rebounds],
          :shoe => rosters[team][:players][player][:shoe],
          :slam_dunks => rosters[team][:players][player][:slam_dunks],
          :steals => rosters[team][:players][player][:steals]
        }
      end
    end
  end
end

def big_shoe_rebounds
  rosters = game_hash
  biggest_shoe = 0
  num_rebounds = 0
  
  rosters.each do |team, value|
    rosters[team][:players].length.times do |player|
      if rosters[team][:players][player][:shoe] > biggest_shoe
        biggest_shoe = rosters[team][:players][player][:shoe]
        num_rebounds = rosters[team][:players][player][:rebounds]
      end
    end
  end
  num_rebounds
end

def most_points_scored
  rosters = game_hash
  most_points = 0
  m_v_p = ""
  
  rosters.each do |team, value|
    rosters[team][:players].length.times do |player|
      if rosters[team][:players][player][:points] > most_points
        most_points = rosters[team][:players][player][:points]
        m_v_p = rosters[team][:players][player][:player_name]
      end
    end
  end
  m_v_p
end

def winning_team
  rosters = game_hash
  home_score = rosters[:home][:players].reduce(0){|memo, n| memo + n[:points]}
  away_score = rosters[:away][:players].reduce(0){|memo, n| memo + n[:points]}
  
  if home_score > away_score
    return "Brooklyn Nets"
  else
    return "Charlotte Hornets"
  end
end

def player_with_longest_name
  rosters = game_hash
  longest_name_length = 0
  longest_name = ""
  
  rosters.each do |team, value|
    rosters[team][:players].length.times do |player|
      if rosters[team][:players][player][:player_name].length > longest_name_length
        longest_name_length = rosters[team][:players][player][:player_name].length
        longest_name = rosters[team][:players][player][:player_name]
      end
    end
  end
  longest_name
end

def long_name_steals_a_ton?
  rosters = game_hash
  most_steals = 0
  stealiest_player = ""
  
  rosters.each do |team, value|
    rosters[team][:players].length.times do |player|
      if rosters[team][:players][player][:steals] > most_steals
        most_steals = rosters[team][:players][player][:steals]
        stealiest_player = rosters[team][:players][player][:player_name]
      end
    end
  end
  
  if stealiest_player == player_with_longest_name
    return true
  end
  
  false
end

#pp team_names
winning_team