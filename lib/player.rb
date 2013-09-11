class Player

attr_accessor :name, :board

	def initialize(name)
		@name = name
		@board = Board.new(self)
	end

	def name
		@name
	end

	def board
		@board
	end

	def has_ships_still_floating?(board)
		@board.board.values.any? { |value| value == "S" }
	end

	def shoot(at_coordinates, opponent_board)
		opponent_board.register_shot(at_coordinates)
	end
end