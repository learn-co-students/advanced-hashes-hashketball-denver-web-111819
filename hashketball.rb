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
               :assists => 2,
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
game_hash
end



def num_points_scored(name)

 home_away_team_info =  game_hash.map {|k, v| v[:players]} #collects all the players into two arrays

 one_array_of_player_hashes = home_away_team_info.flatten #flattens the :home array of hashes and the :away array of hashes into one array

selected_name_index = one_array_of_player_hashes.find_index{|i| i[:player_name] == name} #finds the index of the player name passed in as a parameter

selected_player_points = one_array_of_player_hashes[selected_name_index][:points] #locates the hash and :points value at that index in array

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


