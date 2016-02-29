# Start with n number of disks  on one rod
# There is 3 rods

# The player can move 1 disk onto a road only if no smaller down it

# If all stack up on different rod, win
class TowerOfHanoi

	def initialize number_of_pieces
		@number_of_pieces= number_of_pieces
		@moves
		@board_game =[[], [], []]

		(@number_of_pieces).downto(1) do |i|
			@board_game[0] <<  i
		end
		$win = false
	end


	def check_input
		inputs = false
		while inputs == false

			@moves = nil
			@moves = gets.chomp

			if (@moves =~ /\d \d/) && @moves[0].to_i.between?(1,3) && @moves[-1].to_i.between?(1,3)
				inputs = true
			end
		end
		
	end
	

# Check : There is a piece to move from, the place to move to should be empty or > than the piece moving
	def move_pieces

		temp_moves = @moves.split(" ")
		temp_moves.map! {|move| move.to_i - 1}
		move_from = temp_moves[0]
		move_to = temp_moves[-1]
		moving_piece = @board_game[move_from].last

		if @board_game[move_from].empty? || !@board_game[move_to].empty? && @board_game[move_to].last <  moving_piece
			puts ""
			puts "Cannot do this move !"

			play

		else
			@board_game[move_from].pop

			@board_game[move_to].push moving_piece
		end
	end

					# [[3,2,1], [], []]

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




	def win
		solution = (1..@number_of_pieces).to_a.reverse
		if @board_game[1] == solution || @board_game[2] == solution
			render_board
			puts "You Win !"
			exit
		end
	end

	def play
		while true
			render_board

			puts ""
			puts "What is your move? example : 1 2"

			check_input

			move_pieces

			win
		end
	end

end

t = TowerOfHanoi.new(5)
t.play