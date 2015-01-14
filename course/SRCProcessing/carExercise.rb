class Car

	attr_accessor :xPos, :yPos, :headingDirection
	attr_reader :commands, :directions

	def initialize(coordinates)
		@directions = ["North", "East", "South", "West"]
		@headingDirection = "North"
		@xPos = coordinates[0]
		@yPos = coordinates[1]
		@commands = []
	end

	def move_forward(num)
		c = GoForward.new(self)
		c.execute(num)
		@commands << c
	end

	def turn_right
		c = TurnRight.new(self)
		c.execute(num)
		@commands << c
	end

	def turn_left
		c = TurnLeft.new(self)
		c.execute(num)
		@commands << c
	end

	def report
		@commands.each do |command|
			puts command.report
		end
	end
end

class GoForward

	def initialize(car)
		@car = car
	end

	def execute(kmQuantity)
		case @car.headingDirection
			when "North"
				@car.yPos += kmQuantity
			when "East"
				@car.xPos += kmQuantity
			when "South"
				@car.yPos -= kmQuantity
			when "West"
				@car.xPos -= kmQuantity
		end
	end

	def unexecute
	end

	def report
		puts 'Im a forward command'
	end
end

class TurnRight

	def initialize(car)
		@car = car
		self.execute
	end

	def execute
		if(@car.directions.index(@headingDirection) < @directions.length - 1)
			@headingDirection = @directions[@directions.index(@headingDirection) + 1]
		else
			@headingDirection = @directions[0]
		end
	end

	def report
		puts 'Im a TurnRight command'
	end
end

class TurnLeft

	def initialize(car)
		@car = car
		self.execute
	end

	def execute
		if(@directions.index(@headingDirection) == 0)
			@headingDirection = @directions[@directions.length - 1]
		else
			@headingDirection = @directions[@directions.index(@headingDirection) - 1]
		end
	end

	def report
		puts 'Im a TurnLeft command'
	end
end


#DRIVER CODE
car = Car.new([10,10])
car.turn_right
car.move_forward(15)
car.report









