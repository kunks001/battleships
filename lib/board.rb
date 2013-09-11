class Board

attr_accessor :board

	def initialize(player)
		@player = player
		@board = nil
		

		@aircraft_carrier = 5
		@battleship = 4
		@cruiser = 3
		@submarine = 3
		@destroyer = 3
		@patrol_boat = 2

		@ships = [	@aircraft_carrier,
					@battleship,
					@cruiser,
					@submarine,
					@destroyer,
					@patrol_boat
				 ]

		setup_board
		place_ships

		@opponent_board_view = @board.values
	end

	def owner
		@player.name
	end

	def board
		@board
	end

	def ships
		@ships
	end

	def register_shot(at_coordinates)
		coordinates = at_coordinates.upcase.split("")
		is_a_hit?(coordinates)
	end

	def is_a_hit?(coordinates)
		if board[coordinates] == "S"
			board[coordinates] = "X"
		else	
			board[coordinates] = "O"
		end
	end

	def rows
		@board.values.each_slice(10).to_a
	end

	def setup_board
		@board = Hash[keys.zip(values)]
	end

	def keys
		keys = letters.sort!.zip(numbers)
		keys
	end

	def values
		values = Array.new(100, "")
	end

	def letters
		letters = ("A".."J").to_a
		4.times do
			letters << letters.dup	
			letters.flatten!
			letters = letters[0..99]
		end
		letters
	end

	def numbers
		numbers = ("1".."10").to_a
			4.times do
			numbers << numbers.dup
			numbers.flatten!
			numbers = numbers[0..99]
		end
		numbers
	end

	def place_ships
		@ships.each do |ship|
				horizontal?? horizontal(ship) : vertical(ship)
		end
	end

		def letters_array
		letters_array = ("A".."J").to_a
	end

	def numbers_array
		numbers_array = ("1".."10").to_a
	end

	def horizontal?(probability = nil)
		probability ||= rand(1..2)
		probability == 1? true : false
	end

	def horizontal(ship)
		beginning = rand(0..4)
		ending = beginning+ship
		x_values = letters_array[beginning...ending]

		y_value = ("1".."10").to_a.sample

		horizontal_coordinates(x_values, y_value)
	end

	def horizontal_coordinates(x_values, y_value)
		horizontal_coordinates = x_values.each_slice(1).to_a

		horizontal_coordinates.each do |array|
			array << y_value
		end

		change_to_s(horizontal_coordinates)
	end

	def vertical(ship)
		beginning = rand(0..4)
		ending = beginning+ship

		y_values = numbers_array[beginning...ending]
		x_value = ("A".."J").to_a.sample

		vertical_coordinates(x_value, y_values)
	end

	def vertical_coordinates(x_value, y_values)
		vertical_coordinates = y_values.each_slice(1).to_a

		vertical_coordinates.each do |array|
			array.unshift(x_value)
		end

		change_to_s(vertical_coordinates)
	end

	def change_to_s(coordinates)
		coordinates.each do |xy|
			board[xy] = "S"
		end
	end

	def opponent_view
		@opponent_board_view.map! do |element| 
				element = ""
			end
		@opponent_board_view.each_slice(10).to_a
	end
end