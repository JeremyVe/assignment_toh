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

			if (@moves =~ /\d.\d/) && @moves[0].to_i.between?(1,3) && @moves[-1].to_i.between?(1,3)
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



	def render_board
		printing_render = ["#####", " ### ", "  #  "]
		puts ""
		3.times do |row|
			print " "
			@board_game.each do |i|
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

t = TowerOfHanoi.new(3)
t.play