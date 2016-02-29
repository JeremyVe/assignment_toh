# Start with n number of disks  on one rod
# There is 3 rods

# The player can move 1 disk onto a road only if no smaller down it

# If all stack up on different rod, win

	
board_game = [[3,2,1], [], []]
win = false


def play board_game = board_game
	render board_game
	puts ""
	puts "What is your move? example : 1 2"
	moves = nil
	moves = gets.chomp
	
	unless (moves =~ /\d.\d/) && !moves.nil? && moves[0].to_i.between?(1,3) && moves[-1].to_i.between?(1,3)
		play board_game
	end

	moves = moves.split(" ")
	moves.map! {|move| move.to_i - 1}
	move_from = moves[0]
	move_to = moves[1]
	moving_piece = board_game[move_from].last

	if board_game[move_from].empty? || !board_game[move_to].empty? && board_game[move_to].last <  moving_piece
		puts ""
		puts "Cannot do this move !"

		play board_game

	else
		board_game[move_from].pop

		board_game[move_to].push moving_piece
	end

	win board_game


end

# Check : There is a piece to move from, the place to move to should be empty or > than the piece moving


def render board_game
	printing_render = ["#####", " ### ", "  #  "]
	puts ""
	3.times do |row|
		print " "
		board_game.each do |i|
			case i[2-row]
			when 1
				print printing_render[2]
			when 2
				print printing_render[1]
			when 3
				print printing_render[0]
			else
				print "     "
			end
			print " "
		end
		print "\n"
	end
	print " __|_____|_____|__\n"
	print " __1__|__2__|__3__\n"
end




def win board_game
	if board_game[1] == [3,2,1] || board_game[2] == [3,2,1]
		render board_game
		puts "You Win !"
		exit
		win = true
	end
end


while win == false
	play board_game

end