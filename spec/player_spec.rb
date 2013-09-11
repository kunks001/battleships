require './lib/board'
require './lib/player'

describe Player do

let (:board) { Board.new(player) }
let (:player) { Player.new("John") }


	it 'should initialize with a name' do
		player.name.should eq "John"
	end

	it 'should recognise if there are ships left floating' do
		player.has_ships_still_floating?(board).should eq true
	end
end