score = 0
options = ["P","R","S"] #variable choice

puts "Welcome to Paper, Rock, Scissors"

begin
	def player_choice_check(player_choice)
		if player_choice == "P" || player_choice == "R" || player_choice == "S"
			return player_choice
		else
			puts "Please select either P, R or S"
			player_choice_check(player_choice = gets.chomp)
		end
	end

	def compare_winner (player_choice, computer_choice)
		case 
		when player_choice == "P" && computer_choice == "R"
			return "Player"
		when player_choice == "R" && computer_choice == "S"
			return "Player"
		when player_choice == "S" && computer_choice == "P"
			return "Player"
		when player_choice == computer_choice
			puts "You selected the same thing as the computer.  It's a tie"
		else
			return "Computer"
		end
	end

	computer_choice = options.sample
	puts "What would you like to select (P,R or S)"
	
	score +=1 if compare_winner(player_choice_check(player_choice = gets.chomp), computer_choice) == "Player"
	
	puts "The computer has selected #{computer_choice}"

	puts "You have won #{score} times. Would you like to play again? (Y/N)"
	play_again = gets.chomp

end until play_again.upcase != "Y"
