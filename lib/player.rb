class Player

attr_accessor :name

	def initialize(name)
		@name = name
	end

	def name
		@name
	end

	def has_ships_still_floating?(board)
		board.board.values.any? { |value| value == "S" }
	end

	def shoot(at_coordinates, opponent_board)
		opponent_board.register_shot(at_coordinates)
	end
end