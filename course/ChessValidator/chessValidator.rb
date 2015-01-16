class PieceFactory

	def self.from_string(string)

		pieceString = string.split("")
		
		case pieceString[1]
		when "P"
			pieceToReturn = Peon.new(pieceString[0])
		when "R"
			pieceToReturn = Rook.new(pieceString[0])
		when "N"
			pieceToReturn = Knight.new(pieceString[0])
		when "B"
			pieceToReturn = Bishop.new(pieceString[0])
		when "Q"
			pieceToReturn = Queen.new(pieceString[0])
		when "K"
			pieceToReturn = King.new(pieceString[0])
		else
			pieceToReturn = nil
		end

		pieceToReturn
	end
end

class Piece
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

class Rook < Piece
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
		@chessBoard.check_board_lines_collection
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
		puts
		puts "validate_movement"
		puts "check initial position " + mvm.initPos
		puts "check final position " + mvm.finishPos
	end

	private
	def get_piece_on_position(position)
	end
end



#DRIVER CODE
cmv = ChessMovesValidator.new("simple_board.txt", "simple_moves.txt");





