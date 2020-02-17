# Write your code here!
require 'pry'
def game_hash
game_hash = {
  :home => {:team_name => "Brooklyn Nets",
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
               :steals => 	3,
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
               :slam_dunks => 1}] },
  :away => {:team_name => "Charlotte Hornets",
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
               {
               :player_name => "DeSagna Diop",
               :number => 2,
               :shoe => 14,
               :points => 24,
               :rebounds => 12,
               :assists => 12,
               :steals => 4,
               :blocks => 5,
               :slam_dunks => 5},
               {
               :player_name => "Ben Gordon",
               :number => 8,
               :shoe => 15,
               :points => 33,
               :rebounds => 3,
               :assists => 2,
               :steals => 1,
               :blocks => 1,
               :slam_dunks => 0},
               {
               :player_name => "Kemba Walker",
               :number => 33,
               :shoe => 15,
               :points =>  6,
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

 home_away_team_info =  game_hash.map {|k, v| v[:players]} 
 
 #collects all the players into two arrays

 one_array_of_player_hashes = home_away_team_info.flatten 
 
 #flattens the :home array of hashes and the :away array of hashes into one array

selected_name_index = one_array_of_player_hashes.find_index{|i| i[:player_name] == name} 

#finds the index of the player name passed in as a parameter

selected_player_points = one_array_of_player_hashes[selected_name_index][:points] 

#locates the hash and :points value at that index in array

end

 def shoe_size(name)
   home_away_team_info =  game_hash.map {|k, v| v[:players]} #collects all the players into two arrays

 one_array_of_player_hashes = home_away_team_info.flatten #flattens the :home array of hashes and the :away array of hashes into one array

selected_name_index = one_array_of_player_hashes.find_index{|i| i[:player_name] == name} #finds the index of the player name passed in as a parameter

selected_player_points = one_array_of_player_hashes[selected_name_index][:shoe] #locates the hash and :shoe value at that index in array
  
 end

def team_colors(team_name)
 
 
 game_hash.each do |team, entire_team_hash|
  if entire_team_hash[:team_name] == team_name
    return entire_team_hash[:colors]

  end

 end
 
 
end


def team_names
  game_hash.map{|k,v| v[:team_name]}
end




def  player_numbers(team_name)
 
 game_hash.map do |k,v|
  if  v[:team_name]  == team_name
 return v[:players].map do |player|  
   player[:number]
    end
  end 
end
 
end


def player_stats(player)
  
hold_array = game_hash.select {|k,v| v[:players]}
players_array = hold_array.map {|k,v| v[:players]}
players_array.flatten!
 players_array.each do |a| 
  if a[:player_name]  == player 
    a.delete(:player_name)
    return a
end
end
end


def big_shoe_rebounds

 hold_array2 = game_hash.select {|k,v| v[:players]}
 players_array2 = hold_array2.map {|k,v| v[:players]}
 players_array2.flatten!
  array_of_size_integer = players_array2.map do |a|
    a[:shoe]
 
end
array_of_size_integer.sort!

largest_player_shoe_size = array_of_size_integer[-1]

players_array2.select do |p| 
  if p[:shoe] == largest_player_shoe_size
    return p[:rebounds]
  end
end


end



def most_points_scored   #This works but I don't know how
  
all_keys_and_values = game_hash.select {|k,v| v[:players]}
players_array = all_keys_and_values.map {|k,v| v[:players]}
players_array.flatten!
 
top_scoring_player =  players_array.max_by{|k|  k[:points]}

top_scoring_player[:player_name]


end





def winning_team
 array_of_team_poitns = game_hash.map{|k,v| v[:players].map{|p| p[:points]}}
  team_point_totals =   array_of_team_poitns.map {|a|a.reduce(:+)}
    if team_point_totals[0] > team_point_totals[1]
      return "Brooklyn Nets"
    else 
      return "Charlotte Hornets"
    end
end


def player_with_longest_name
array_of_team_names = game_hash.map{|k,v| v[:players].map{|p| p[:player_name]}}
array_of_team_names.flatten!
array_of_team_names.max_by{|k| k.length}

end 




def long_name_steals_a_ton?
  
all_keys_and_values = game_hash.select {|k,v| v[:players]}
players_array = all_keys_and_values.map {|k,v| v[:players]}
players_array.flatten!
 
top_scoring_player =  players_array.max_by{|k|  k[:steals]}

if top_scoring_player[:player_name] == player_with_longest_name

  return true
end
end
