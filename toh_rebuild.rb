# Start with n number of disks  on one rod
# There is 3 rods

# The player can move 1 disk onto a road only if no smaller down it

# If all stack up on different rod, win
class TowerOfHanoi

	# Initiate number of pieces, and board
	def initialize number_of_pieces
		@number_of_pieces= number_of_pieces
		@moves
		@board_game =[[], [], []]

		(@number_of_pieces).downto(1) do |i|
			@board_game[0] <<  i
		end
		$win = false
	end

	# check if input is correct or is exit
	def check_input
		inputs = false
		while inputs == false

			@moves = gets.chomp
			temp_move = @moves.split(" ")
			if @moves == "quit"
				exit

			elsif temp_move[0].to_i.between?(1,3) && temp_move[-1].to_i.between?(1,3)
				inputs = true
			else
				puts "Wrong Move !"
			end
		end
		
	end
	

	def move_pieces

		# split user input, and create variables for starting and ending place, and the piece
		temp_moves = @moves.split(" ")
		temp_moves.map! {|move| move.to_i - 1}
		move_from = temp_moves[0]
		move_to = temp_moves[-1]
		moving_piece = @board_game[move_from].last

		# Check if can move
		if @board_game[move_from].empty? || !@board_game[move_to].empty? && @board_game[move_to].last <  moving_piece
			puts ""
			puts "Cannot do this move !"

			play

			# Move
		else
			@board_game[move_from].pop
			@board_game[move_to].push moving_piece

			puts "you moved from #{move_from} to #{move_to}"

		end
	end

	# Loop through each row and check the value, then check and print according to the value
	# Until Bottom of the Board_game

	def render_board
		puts ""
		@number_of_pieces.times do |row|
			print "  "
			@board_game.each do |col|
				current_item = @number_of_pieces-1-row

				if col[current_item] == 1
					print "#".center(@number_of_pieces*2-1)
				elsif col[current_item].nil?
					print " " + "  " * (@number_of_pieces-1)
				else 
					print ("#" + "##" * (col[current_item]-1)).center(@number_of_pieces*2-1)
				end
				print " "
			end
			print "\n"
		end
		print " |" + ("_" * (@number_of_pieces*2-1) + "|") * 3 + "\n"
		print " |"
		(1..3).each {|number| print "_" * (@number_of_pieces-1) + "#{number}" + "_" * (@number_of_pieces-1) + "|"}
		print "\n"
	end


	# Check if Win
	def win
		solution = (1..@number_of_pieces).to_a.reverse
		if @board_game[1] == solution || @board_game[2] == solution
			render_board
			puts "\nYou Win !\n"
			exit
		end
	end

	# Launch the game
	def play
		while true
			render_board

			puts ""
			puts "What is your move? example : 1 2  /  \"quit\" to exit"

			check_input

			move_pieces

			win
		end
	end

end

t = TowerOfHanoi.new(5)
t.play