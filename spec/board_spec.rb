require './lib/board'
require './lib/player'

describe Board do

let (:board) {Board.new(player)}
let (:player) {Player.new("John")}

#### INITIALIZE
####################

	it 'should initialise with an owner' do
		board.owner.should eq "John"
	end

	it 'should initialise with an array of 6 ships' do
		board.ships.count.should eq 6
	end

#### GENERATING X/Y-VALUES FOR THE BOARD
####################

	it 'should generate a letters array with 100 values' do
		board.letters.count.should eq 100
	end

	it 'should generate an array of letters' do
		board.letters[0].should eq "A"
		board.letters[99].should eq "J"
	end

	it 'should generate a numbers array with 100 values' do
		board.numbers.count.should eq 100
	end

	it 'should generate an array of numbers' do
		board.numbers[0].should eq "1"
		board.numbers[99].should eq "10"
	end

#### GENERATING THE BOARD
####################

	it 'should generate 100 board values' do
		board.values.count.should eq 100
	end

	it 'should generate values of empty strings' do
		board.values[0].should eq ""
	end

	it 'shouldgenerate 100 board keys' do
		board.keys.count.should eq 100
	end

	it 'should generate keys a1 - j10' do
		board.keys.should include(["A", "1"], ["J", "10"])
	end

	it 'should create a hash with the keys and values' do
		board.board.should include(["A", "1"] => "")
	end

#### GENERATING THE SHIPS
####################

	it 'should have a 50/50 chance of being horizontal or vertical' do
		board.horizontal?(1).should eq true
		board.horizontal?(2).should eq false
	end

	it 'should return horizontal coordinates equal to length of ship' do
		board.horizontal(3).count.should eq 3
	end

	it 'should return vertical coordinates equal to length of ship' do
		board.vertical(3).count.should eq 3
	end

	it 'should return genuine coordinates' do
		board.board.should include board.horizontal(3).first
	end

#### RETURNING THE BOARD
####################

	it 'should return the board as a multidimensional array' do
		board.rows[0].class.should eq Array
	end

	it 'should return a board with 10 rows' do
		board.rows.count.should eq 10
	end

	it 'should return a board with 10 columns' do
		board.rows[0].count.should eq 10
	end
		
#### RETURNING THE OPPONENT'S VIEW
####################

	it 'should return a board with empty string values' do
		board.opponent_view[0].should eq Array.new(10, "")
	end

#### REGISTERING A SHOT
####################

	it 'should register a shot' do
		board.register_shot("A1")
		board.board[["A", "1"]].should_not eq ""||"S"
	end
end