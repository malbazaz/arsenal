#our CLI controller

class Arsenal::CLI 

def call
	puts "Welcome to Arsenal FC !!!!"
	list_players
	menu
end 

def list_players
	puts <<-DOC
	Arsenal Players:
		1. Mesut Ozil
		2. Calum Chambers
		3. Aaron Ramsey
		4. Granit Xhaka
		5. Stefan Lichsteiner
		DOC
# -- Here, I will take All Players from main page and will print their name in a list
end 

def menu
	puts "Enter the number of Arsenal player you'd like more information on:"
	input = nil 
	while input != "exit"
		input = gets.strip.downcase
		case input
		when "1"
			puts "You've selected Mesut Ozil"
		when "2"
			puts "You've selected Calum Chambers"
		when "3"
			puts "You've selected Aaron Ramsey"
		when "4"
			puts "You've selected Granit Xhaka"
		when "5"
			puts "You've selected Stefan Lichsteiner"
		end 
	end 
end 
	
	# Here each selection should not only put the player name but also provide more information.	

end
