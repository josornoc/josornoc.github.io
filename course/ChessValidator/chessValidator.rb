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
		parseChessFiles(boardFileName,movesFileName)		
	end

	def parseChessFiles( boardFileName, movesFileName )
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
			@chessBoard.validate_movement(pMov)
		end
	end
end

class PieceMovement
	attr_reader :initPos, :finishPos
	def initialize(initPos, finishPos)
		@initPos = initPos
		@finishPos = finishPos
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

		pieceOnFirstPosition = init_movement_validation(mvm)

		if(pieceOnFirstPosition == nil)			
			return @isMvmPosible
		else
			check_final_position(pieceOnFirstPosition, mvm)
		end

		if @isMvmPosible
			puts "Its okay, the piece can take the rival one..... "
			check_piece_movement_rules(pieceOnFirstPosition, mvm.initPos, mvm.finishPos)	
		else
			puts "Movement invalid, cannot move to the same place where a friend is..... "
		end
		
	end

	private
	def init_movement_validation(mvm)
		@isMvmPosible = false
		get_piece_on_position(mvm.initPos)
	end

	def check_final_position(piece1, mvm)
		pieceOnFinalPosition  = get_piece_on_position(mvm.finishPos)
		if( pieceOnFinalPosition != nil )
			eval_if_different_sizes(piece1, pieceOnFinalPosition)
		end
	end

	def eval_if_different_sizes(piece1, piece2)
		if( piece1.side != piece2.side )
			@isMvmPosible = true
		else
			@isMvmPosible = false
			return @isMvmPosible
		end
	end

	def get_piece_on_position(iPosition)

		firstChar = iPosition.split("")[0]
		pieceCoords = []

		case firstChar
		when "a"
			pieceCoords[0] = 0
		when "b"
			pieceCoords[0] = 1
		when "c"
			pieceCoords[0] = 2
		when "d"
			pieceCoords[0] = 3
		when "e"
			pieceCoords[0] = 4
		when "f"
			pieceCoords[0] = 5
		when "g"
			pieceCoords[0] = 6
		when "h"
			pieceCoords[0] = 7
		end

		#use ZIP method to resume these extra lines
		lastChar = iPosition.split("")[1].to_i
		case lastChar
		when 1
			pieceCoords[1] = 0
		when 2
			pieceCoords[1] = 1
		when 3
			pieceCoords[1] = 2
		when 4
			pieceCoords[1] = 3
		when 5
			pieceCoords[1] = 4
		when 6
			pieceCoords[1] = 5
		when 7
			pieceCoords[1] = 6
		when 8
			pieceCoords[1] = 7
		end

		@boardLineCollection[pieceCoords[1]][pieceCoords[0]]
	end

	def check_piece_movement_rules(piece, p1, p2)
		piece.evaluate_mvm_rules(p1, p2)
	end	
end

class Rook < Piece

	def initialize(side)
		@rules = ["sameColumn", "sameRow"]
		super(side)
	end

	def evaluate_mvm_rules(p1, p2)
		if(p1[0] == p2[0])
			puts "same column ---- movement okay"
		elsif (p1[1] == p2[1])
			puts "same row ---- movement okay"
		else
			puts "not the same column or row --- movement not okay"
		end
	end
end


#DRIVER CODE
cmv = ChessMovesValidator.new("simple_board.txt", "simple_moves.txt");

















