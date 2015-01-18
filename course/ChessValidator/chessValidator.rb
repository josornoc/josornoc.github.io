class PieceFactory

	def self.from_string(string)

		sideString = string.split("")
		
		case sideString[1]
		when "P"
			pieceToReturn = Pawn.new(sideString[0])
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
	def method_missing(m, *args, &block)
		puts "Method called '" + m.to_s + "' doesn't exists in this Piece yet..."
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

class Pawn < Piece
	def initialize(side)
		super(side)
	end
end


class ChessMovesValidator

	def initialize( boardFileName, movesFileName )
		@chessBoard = ChessBoard.new
		@movesCollection = []
		parse_chess_files(boardFileName,movesFileName)		
	end

	def parse_chess_files( boardFileName, movesFileName )
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
	end

	def create_board_line(boardLine)
		boardLine = create_board_spaces(boardLine)
		@boardLineCollection << boardLine
	end

	def validate_movement(mvm)
		#RETURN TRUE IS VALID AND FALSE IF INVALID
		pieceOnFirstPosition = get_piece_on_position(mvm.initPos)
		pieceOnLastPosition = get_piece_on_position(mvm.finishPos)
		pieceMvmRoute = get_piece_movement_route(pieceOnFirstPosition, mvm.initPos, mvm.finishPos)
	end

	private
	def get_piece_movement_route(piece, firstPos, finalPos)

		#if a friend is mvm is invalid
		#if Knight this is overriden, no matter what....
		#if a foe is on route, not in final position the mvm is also invalidated

		puts "Get_piece_movement_route "
		gRouteArray = piece.get_route_positions_array(firstPos, finalPos)

		# if(gRouteArray != nil)
		# 	gRouteArray.each do |position|
		# 		eval_route_next_step(position)
		# 	end
		# else
		# 	puts "gRouteArray is nil"
		# end
	end

	def get_piece_on_position(pos)
		firstChar = pos.split("")[0]
		pieceCoords = []
		pieceCoords[0] = CoordConverter.get_number_of_stringchar(firstChar)
		lastChar = pos.split("")[1].to_i
		pieceCoords[1] = lastChar - 1
		@boardLineCollection[pieceCoords[1]][pieceCoords[0]]
	end

	def eval_route_next_step(stepPosition)
		puts "eval_route_next_step"
		puts stepPosition
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

	def eval_if_different_sides(piece1, piece2)
		piece1.side != piece2.side
	end

end

class Rook < Piece
	def initialize(side)
		super(side)
	end	
	def get_route_positions_array(p1, p2)
		fPosCoords = [CoordConverter.get_number_of_stringchar(p1[0]), p1[1].to_i - 1]
		fPos2Coords = [CoordConverter.get_number_of_stringchar(p2[0]), p2[1].to_i - 1]
		gRouteArray = Routes.get_route_from_coords(fPosCoords, fPos2Coords, ["vertical", "horizontal"])
		gRouteArray
	end
end

class Routes
	def self.get_route_from_coords(coord1, coord2, rTypes)

		hashResult = self.get_boolean_hash_of_route_types(coord1, coord2, rTypes)

		hashResult.each do |item, x|
			if x == true
				p item
			end
		end

		# if self.check_if_vertical(coord1, coord2, rTypes)
		# 	get_vertical_route(coord1, coord2)
		# else
		# 	nil
		# end
	end
	def self.get_boolean_hash_of_route_types(coord1, coord2, rTypes)
		booleanResultRouteType = []
		rTypes.each do |routeType|
			case routeType
			when "vertical"
				booleanResultRouteType << self.check_if_vertical(coord1, coord2, rTypes)
			when "horizontal"
				booleanResultRouteType << self.check_if_horizontal(coord1, coord2, rTypes)
			when "diagonal"
				puts "check diagonal found"
			end
		end
		rHash = rTypes.zip(booleanResultRouteType).to_h
		rHash
	end
	def self.check_if_vertical(coord1, coord2, rTypes)
		coord1[0] == coord2[0] && rTypes.index("vertical") > -1
	end
	def self.check_if_horizontal(coord1, coord2, rTypes)
		coord1[1] == coord2[1] && rTypes.index("horizontal") > -1
	end
	def self.get_horizontal_route(coord1, coord2)
		false
	end
	def self.get_vertical_route(coord1, coord2)
		if(coord1[1] > coord2[1])
			tArray = (coord2[1]..coord1[1]).to_a
			tArray = tArray.reverse
		else
			tArray = (coord1[1]..coord2[1]).to_a
		end

		tmpArray = []
		tArray.each do |i|
			tmpArray << CoordConverter.get_stringchar_of_number(coord1[0])+(i+1).to_s
		end

		tmpArray = tmpArray[1,tmpArray.length-1]
		tmpArray
	end
end

class CoordConverter
	def self.get_number_of_stringchar(stringChar)
		charArray = ("a".."z").to_a
		rCoordNum = charArray.index(stringChar)
		rCoordNum
	end
	def self.get_stringchar_of_number(number)
		charArray = ("a".."z").to_a
		rCoordStr = charArray[number]
		rCoordStr
	end
end



#DRIVER CODE
cmv = ChessMovesValidator.new("simple_board.txt", "simple_moves.txt");

















