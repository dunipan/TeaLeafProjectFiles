=begin
blackjack pseudo code

player name enter
deck of cards held in shute 52 options suited in hash format (number and suit)
dealer will deal player two cards which will be told to player (randomized) and the player will be given a score
two cards will be removed from the deck
dealer will be given two cards which will be held from player (or maybe one card showing)
those cards will be	removed from the deck
the player will be prompted to hit or stay
if the player chooses to hit another card will be dealt at random from the deck
the player will know the card and it will be added to their score
if the player chooses to stay the second dealer card will be revealed and the totals will be compared to declare a winner
the player will be prompted to hit or stay again same rules apply as above

other options:
- aces need to be given whatever value is lowest between 1 and 11
- player busts and the game is over if they exceed 21
- dealer hits on anything less than 17
- face cards need to be converted to a score of 10


=end
puts "                 "
puts "Welcome to Blackjack!"

puts "What is your name?"
player_name = gets.chomp

puts "How many deck of cards would you like to play with?(1-4)"
decks = gets.chomp.to_i

#key variables used throughout program
#________________________________

deck_of_cards = {1 => {"number" => "Ace", "suit" => "hearts", "value1" => 1, "value2" =>11 }, 2 => {"number" => "2", "suit" => "hearts", "value1"=>2}, 3 => {"number" => "3", "suit" => "hearts", "value1" => 3}, 4 => {"number" => "4", "suit" => "hearts", "value1"=>4}, 5 => {"number" => "5", "suit" => "hearts", "value1" => 5}, 6 => {"number" => "6", "suit" => "hearts", "value1" => 6}, 7 => {"number" => "7", "suit" => "hearts", "value1"=>7}, 8 => {"number" => "8", "suit" => "hearts", "value1" => 8}, 9 => {"number" => "9", "suit" => "hearts", "value1"=>9}, 10 => {"number" => "10", "suit" => "hearts", "value1" => 10}, 11 => {"number" => "Jack", "suit" => "hearts", "value1"=>10}, 12 => {"number" => "Queen", "suit" => "hearts", "value1" => 10}, 13 => {"number" => "King", "suit" => "hearts", "value1" => 10},
	14 => {"number" => "Ace", "suit" => "clubs", "value1" => 1, "value2" =>11 }, 15 => {"number" => "2", "suit" => "clubs", "value1"=>2}, 16 => {"number" => "3", "suit" => "clubs", "value1" => 3}, 17 => {"number" => "4", "suit" => "clubs", "value1"=>4}, 18 => {"number" => "5", "suit" => "clubs", "value1" => 5}, 19 => {"number" => "6", "suit" => "clubs", "value1" => 6}, 20 => {"number" => "7", "suit" => "clubs", "value1"=>7}, 21 => {"number" => "8", "suit" => "clubs", "value1" => 8}, 22 => {"number" => "9", "suit" => "clubs", "value1"=>9}, 23 => {"number" => "10", "suit" => "clubs", "value1" => 10}, 24 => {"number" => "Jack", "suit" => "clubs", "value1"=>10}, 25 => {"number" => "Queen", "suit" => "clubs", "value1" => 10}, 26 => {"number" => "King", "suit" => "clubs", "value1" => 10},
	27 => {"number" => "Ace", "suit" => "diamonds", "value1" => 1, "value2" =>11 }, 28 => {"number" => "2", "suit" => "diamonds", "value1"=>2}, 29 => {"number" => "3", "suit" => "diamonds", "value1" => 3}, 30 => {"number" => "4", "suit" => "diamonds", "value1"=>4}, 31 => {"number" => "5", "suit" => "diamonds", "value1" => 5}, 32 => {"number" => "6", "suit" => "diamonds", "value1" => 6}, 33 => {"number" => "7", "suit" => "diamonds", "value1"=>7}, 34 => {"number" => "8", "suit" => "diamonds", "value1" => 8}, 35 => {"number" => "9", "suit" => "diamonds", "value1"=>9}, 36 => {"number" => "10", "suit" => "diamonds", "value1" => 10}, 37 => {"number" => "Jack", "suit" => "diamonds", "value1"=>10}, 38 => {"number" => "Queen", "suit" => "diamonds", "value1" => 10}, 39 => {"number" => "King", "suit" => "diamonds", "value1" => 10},
	40 => {"number" => "Ace", "suit" => "spades", "value1" => 1, "value2" =>11 }, 41 => {"number" => "2", "suit" => "spades", "value1"=>2}, 42 => {"number" => "3", "suit" => "spades", "value1" => 3}, 43 => {"number" => "4", "suit" => "spades", "value1"=>4}, 44 => {"number" => "5", "suit" => "spades", "value1" => 5}, 45 => {"number" => "6", "suit" => "spades", "value1" => 6}, 46 => {"number" => "7", "suit" => "spades", "value1"=>7}, 47 => {"number" => "8", "suit" => "spades", "value1" => 8}, 48 => {"number" => "9", "suit" => "spades", "value1"=>9}, 49 => {"number" => "10", "suit" => "spades", "value1" => 10}, 50 => {"number" => "Jack", "suit" => "spades", "value1"=>10}, 51 => {"number" => "Queen", "suit" => "spades", "value1" => 10}, 52 => {"number" => "King", "suit" => "spades", "value1" => 10}}

deck_of_cards.each do |card_num, details|
		details["drawn"] = 0
	end
#________________________

begin
	#key variables used throughout program
	#________________________________
	player_hand = {}
	dealer_hand = {}
	
	
	# deal method randomly selects a single card from "deck of cards" hash
	def deal(deck_of_cards)
		deal = rand(1..52)
		if deck_of_cards.has_key?(deal) == true
			return deck_of_cards[deal]
		else
			deal(deck_of_cards)
		end
	end

	# player hand takes a dealt card and stores into player_hand variable, card is read to player
	def player_hand (card, player_hand, deck_of_cards, count, decks)
		player_hand[count] = card

		deck_of_cards.each {|card_num, details| details["drawn"] +=1 if details == card}
		deck_of_cards.delete_if{|card_num, details| details == card && details["drawn"]==decks}

		player_hand.each do |card_num, details|
			if player_hand[card_num] == player_hand[count]
				puts "You received a #{details["number"]} of #{details["suit"]}"
			end
		end
	end

	# dealer hand takes a dealt card and stores into player_hand variable, card is read to player
	def dealer_hand (card, dealer_hand, deck_of_cards, count, show, decks)
		dealer_hand[count] = card
		
		deck_of_cards.each {|card_num, details| details["drawn"] +=1 if details == card}
		deck_of_cards.delete_if{|card_num, details| details == card && details["drawn"]==decks}

		if show == "Y"
			dealer_hand.each do |card_num, details|
				if dealer_hand[card_num] == dealer_hand[count]
					puts "Dealer received a #{details["number"]} of #{details["suit"]}"
				end
			end
		elsif  show == "N"
			puts "Dealer has received an unknown card"
		end
	end

	# score method return score to either player or dealer in Ace low card/ no Ace scenario
	def score (hand)
		score = 0
		hand.each do |card_num, details|
			score = score + details["value1"]
		end
		
		return score
	end

	# method checks if Ace is included in hand
	def ace_include? (hand)
		ace_count = 0
		hand.each {|card_num, details| ace_count +=1 if details["number"].include?("Ace") == true}

		return true if ace_count > 0
		return false if ace_count == 0

	end

	# method returns Ace High score to be compared against Ace low score
	def score_ace_high (score, hand)
		score2 = 0
		hand.each do |card_num, details|
			if details["number"] == "Ace"
				if score < 12
					score2 = score + details["value2"] - 1
				elsif score >11
					score2 = score2 + score + details["value1"] - 1	
				end
			end
		end
		
		return score2
	end

	# method writes to console player or dealer's given score at a point in time, based on various scenarios (Ace High/ Low,  Bust/ no Bust etc.)
	def read_out (player, score, show, ace_include, score_ace_high)
		if show == "Y" && ace_include == false
			if score <22 
				puts "#{player} has #{score}"
			elsif score >21
				puts "#{player} has #{score} and has busted"
			end
		elsif show == "Y" && ace_include == true
			if score_ace_high > 21
				puts "#{player} has #{score}"
			elsif score_ace_high == 21
				puts "#{player} has BLACKJACK"
			elsif score >21 && score_ace_high >21
				puts "#{player} has busted"
			elsif score_ace_high < 22 && score != score_ace_high
				puts "#{player} has #{score} or #{score_ace_high}"
			elsif score_ace_high < 22 && score == score_ace_high
				puts "#{player} has #{score}"
			end
		elsif show == "N"
			puts "Dealer has an unknown score"
		end
	end

	#method calculates the best case score for player or dealer based on Ace being present, avoids bustings
	def score_reset(score_ace_low, score_ace_high)
		score_final = 0

		if score_ace_high > score_ace_low && score_ace_high < 22
			score_final = score_ace_high
		else
			score_final = score_ace_low
		end

		return score_final
	end

	#method determines and provides output for who the winner is
	def winning_hand (player_score, dealer_score, player_name)
		if player_score > dealer_score && player_score <22
			puts "#{player_name} wins"
		elsif player_score == dealer_score
			puts "It's a push"
		elsif dealer_score > player_score && dealer_score <22
			puts "Dealer wins"
		elsif dealer_score > player_score && dealer_score >21
			puts "#{player_name} wins"
		else
			puts "Dealer wins"
		end
	end

	# game aesthetics to simulate shuffling
	puts "___________________________________________________________________"
	sleep 1.5
	puts "<<cards shuffling>>"
	puts "             "
	sleep 1.5
	puts "<<cards shuffling>>"
	puts "___________________________________________________________________"
	puts "             "
	sleep 1.5
	
	# initial cards are dealt to player and dealer
	player_hand(deal(deck_of_cards), player_hand, deck_of_cards, player_hand.keys.count+1, decks)
	sleep 1.5
	dealer_hand(deal(deck_of_cards), dealer_hand, deck_of_cards, dealer_hand.keys.count+1, "N", decks)
	sleep 1.5
	player_hand(deal(deck_of_cards), player_hand, deck_of_cards, player_hand.keys.count+1, decks)
	sleep 1.5
	dealer_hand(deal(deck_of_cards), dealer_hand, deck_of_cards, dealer_hand.keys.count+1, "Y", decks)
	sleep 1.5

	# read out of scores based on initial cards dealth
	puts "___________________________________________________________________"
	score(player_hand)
	read_out(player_name, score(player_hand), "Y", ace_include?(player_hand), score_ace_high(score(player_hand), player_hand))
	sleep 1.5
	score(dealer_hand)
	read_out("Dealer", score(dealer_hand), "N", ace_include?(dealer_hand), score_ace_high(score(dealer_hand), dealer_hand))
	sleep 1.5
	puts "___________________________________________________________________"
	puts "             "

	# player option to hit or stay based on current score
	begin 
		if score_ace_high(score(player_hand), player_hand) < 21
			sleep 1.5
			p "Would you like to hit or stay? (H/S)"
			player_option = gets.chomp.upcase

			if player_option == "H"
				sleep 1.5
				player_hand(deal(deck_of_cards), player_hand, deck_of_cards, player_hand.keys.count+1, decks)
				score(player_hand)
				sleep 1.5
				read_out(player_name, score(player_hand),"Y", ace_include?(player_hand), score_ace_high(score(player_hand), player_hand))
				puts "___________________________________________________________________"
			end
		end
	end until player_option == "S" || score(player_hand) >20 || score_ace_high(score(player_hand), player_hand) == 21

	# dealer's turn, pre-determined hit or stay based on score of 16 or less
	if score(player_hand) <22
		sleep 1.5
		puts "___________________________________________________________________"
		puts "The dealer will now go"
		puts " ...."
		sleep 1

		dealer_hand.each do |card_num, details|
			if card_num == 1
				puts "Dealer shows a #{details["number"]} of #{details["suit"]}"
			end
		end

		read_out("Dealer", score(dealer_hand), "Y", ace_include?(dealer_hand), score_ace_high(score(dealer_hand), dealer_hand))

		begin 
			if score(dealer_hand) <17 && score_ace_high(score(dealer_hand), dealer_hand) != 21
				sleep 1.5
				puts "Dealer hits"
				dealer_hand(deal(deck_of_cards), dealer_hand, deck_of_cards, dealer_hand.keys.count+1, "Y", decks)
				sleep 1.5
				read_out("Dealer", score(dealer_hand), "Y", ace_include?(dealer_hand), score_ace_high(score(dealer_hand), dealer_hand))
				score(dealer_hand)
			else
				sleep 1.5
				puts "Dealer stays"
				score(dealer_hand)
			end
		end until score(dealer_hand) >16 || score_ace_high(score(dealer_hand), dealer_hand) == 21 
	end

	puts "___________________________________________________________________"
	puts ">>>>>>>"
	sleep 1.5
	winning_hand(score_reset(score(player_hand), score_ace_high(score(player_hand), player_hand)), score_reset(score(dealer_hand), score_ace_high(score(dealer_hand), dealer_hand)), player_name)

	puts "Would you like to play again? (Y/N)"
	play_again = gets.chomp.upcase

end until play_again == "N"