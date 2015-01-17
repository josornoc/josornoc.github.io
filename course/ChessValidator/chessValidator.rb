class PieceFactory

	def self.from_string(string)

		sideString = string.split("")
		
		case sideString[1]
		when "P"
			pieceToReturn = Peon.new(sideString[0])
		when "R"
			pieceToReturn = Rook.new(sideString[0])
		when "N"
			pieceToReturn = Knight.new(sideString[0])
		when "B"
			pieceToReturn = Bishop.new(sideString[0])
		when "Q"
			pieceToReturn = Queen.new(sideString[0])
		when "K"
			pieceToReturn = King.new(sideString[0])
		else
			pieceToReturn = nil
		end

		pieceToReturn
	end
end

class Piece
	attr_reader :side
	def initialize(side)
		@side = side
	end
end

class King < Piece
	def initialize(side)
		super(side)
	end
end

class Queen < Piece
	def initialize(side)
		super(side)
	end
end

class Knight < Piece
	def initialize(side)
		super(side)
	end
end

class Bishop < Piece
	def initialize(side)
		super(side)
	end
end

class Peon < Piece
	def initialize(side)
		super(side)
	end

end


class ChessMovesValidator

	def initialize( boardFileName, movesFileName )
		@movesCollection = []
		parse_chess_file(boardFileName,movesFileName)		
	end

	def parse_chess_file( boardFileName, movesFileName )
		@chessBoard = ChessBoard.new
		process_board(boardFileName)
		process_moves(movesFileName)
	end

	private
	def process_board( boardFileName )
		bfn = IO.read(boardFileName)
		bfn = bfn.split("\n");
		bfn.each do |bLine|
			bSpace = bLine.split(" ")
			@chessBoard.create_board_line(bLine)
		end
	end

	def process_moves(movesFileName)
		@moves = IO.read(movesFileName)
		movesTmp = @moves.split("\n")
		movesTmp.each do |move|
			t = move.split(" ")
			@movesCollection << PieceMovement.new(t[0],t[1])
		end
		check_movement_array(@movesCollection)
	end

	def check_movement_array(mvmArray)
		mvmArray.each do |pMov|
			pMov.isValid = @chessBoard.validate_movement(pMov)
		end
	end
end

class PieceMovement
	attr_reader :initPos, :finishPos
	attr_writer :isValid
	def initialize(initPos, finishPos)
		@initPos = initPos
		@finishPos = finishPos
		@isValid = "NOT TESTED"
	end
end

class ChessBoard

	def initialize
		@boardSideSize = 0;
		@boardLineCollection = []
		@boardSpacesCollection = []
	end

	def create_board_line(boardLine)
		boardLine = create_board_spaces(boardLine)
		@boardLineCollection << boardLine
	end

	def create_board_spaces(boardLine)
		piecesClassArray = []
		t = boardLine.split(" ")
		t.each do |space|
			space = PieceFactory.from_string(space)
			piecesClassArray << space
		end
		piecesClassArray
	end

	def check_board_lines_collection
		print @boardLineCollection
	end

	def validate_movement(mvm)
		#RETURN TRUE IS VALID AND FALSE IF INVALID
		pieceOnFirstPosition = get_piece_on_position(mvm.initPos)
		pieceOnLastPosition = get_piece_on_position(mvm.finishPos)
		pieceMvmRoute = get_piece_movement_route(pieceOnFirstPosition, mvm.initPos, mvm.finishPos)
	end

	private
	def get_piece_movement_route(piece, firstPos, finalPos)
		#detect route regarding piece movement rules
		#route must be an array of positions
		#array must be checked if something is placed of each position
		#if a friend is mvm is invalid
		#if Knight this is overriden, no matter what....
		#if a foe is on route, not in final position the mvm is also invalidated
		piece.get_route_positions_array(firstPos, finalPos)
	end

	def eval_if_different_sides(piece1, piece2)
		piece2 == nil || piece1.side != piece2.side
	end

	def get_piece_on_position(iPosition)
		firstChar = iPosition.split("")[0]
		pieceCoords = []
		pieceCoords[0] = CoordConverter.get_number_of_string_char(firstChar)
		lastChar = iPosition.split("")[1].to_i
		pieceCoords[1] = lastChar - 1
		@boardLineCollection[pieceCoords[1]][pieceCoords[0]]
	end

	def check_piece_movement_rules(piece, p1, p2)
		piece.evaluate_mvm_rules(p1, p2)
	end	
end

class Rook < Piece
	def initialize(side)
		super(side)
	end
	def evaluate_mvm_rules(p1, p2)
		booleanReturn = false
		if(p1[0] == p2[0])
			booleanReturn = true
		elsif (p1[1] == p2[1])
			booleanReturn = true
		else
			booleanReturn = false
		end
		booleanReturn
	end
	def get_route_positions_array(p1, p2)
		puts "get_route_positions_array"	
		puts "column: " + CoordConverter.get_number_of_string_char(p1[0]).to_s
		puts "row: " + p1[1].to_s
	end
end

class CoordConverter
	def self.get_number_of_string_char(stringChar)
		charArray = ("a".."z").to_a
		rCoordNum = charArray.index(stringChar)
		rCoordNum
	end
end



#DRIVER CODE
cmv = ChessMovesValidator.new("simple_board.txt", "simple_moves.txt");

















