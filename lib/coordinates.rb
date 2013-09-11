module Coordinates

	def letters_array
		letters_array = ("A".."J").to_a
	end

	def numbers_array
		numbers_array = ("1".."10").to_a
	end

	def ship_length
		@ships.each do |ship|
			horizontal?? horizontal(ship) : vertical(ship)
		end
	end

	def horizontal?
		probability = rand(1..2)
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

	def change_to_S(coordinates)
		coordinates.each do |xy|
			board[xy] = "S"
		end
	end
end