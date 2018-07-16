#our CLI controller

class Arsenal::CLI 

	def call
		puts "Welcome to Arsenal FC !!!!"
		main_scrape_and_collect
		list_players
		menu
  	end 

	def main_scrape_and_collect
#-- Scrape all the players from the main_page and create a player's collection
		@scrapped_players = Arsenal::Scraper.scrape_main_page
		@@players = Arsenal::Player.create_from_collection(@scrapped_players)
	end 

	def list_players
# -- Print the names of all players in a list for selection
		puts "Please find all the Arsenal players"
		Arsenal::Player.all.each_with_index do |player_listing, index|
		index +=1
		puts "#{index}. #{player_listing.name}"
		end 
	end 

	def display_scraped_listing(player_hash)
		player_hash.each do |key, value|
		puts "#{key}: #{value}"
		end 
	end 

	def menu
#-- Takes in the player selection and provide the selected player's full profile.
		puts "Enter the number of Arsenal player you'd like more information on:"
		input = gets.to_i  
		if input > 0 
				while input > Arsenal::Player.all.size 
					puts "The number you have entered is invalid. Please try again."
					input = gets.to_i 
				end 
			index = input - 1
				if !Arsenal::Player.all[index].bio
					@new_player_hash = Arsenal::Scraper.scrape_profile_page(Arsenal::Player.all[index])
				end 
			puts "You've selected #{Arsenal::Player.all[index].name}, please find his profile:"
			display_scraped_listing(@new_player_hash)
		 
		#	Player.all.each_with_index do |player_listing, index|
		#		index += 1
		#			if index == input
		#				puts "You've selected #{player_listing.name}, please find his profile:"
		#				new_player_hash = Scraper.scrape_profile_page(player_listing)
		#			end 
		#	end 
			puts "Re-enter the number of another player, you would like more information on. To exit, enter 0."
			menu
		end 
	end
end 




# extra credit: add player list

# Manual : Entry
#	puts <<-DOC
#	Arsenal Players:
#		1. Mesut Ozil
#		2. Calum Chambers
#		3. Aaron Ramsey
#		4. Granit Xhaka
#		5. Stefan Lichsteiner
#		DOC
# -------------
#	input = nil 
#	while input != "exit"
#		input = gets.strip.downcase
#		case input
#		when "1"
#			puts "You've selected Mesut Ozil"
#		when "2"
#			puts "You've selected Calum Chambers"
#		when "3"
#			puts "You've selected Aaron Ramsey"
#		when "4"
#			puts "You've selected Granit Xhaka"
#		when "5"
#			puts "You've selected Stefan Lichsteiner"
#		