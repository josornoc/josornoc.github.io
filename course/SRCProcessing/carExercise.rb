class Car

	attr_reader :xPos, :yPos, :commands

	def initialize(coordinates)
		@directions = ["North", "East", "South", "West"]
		@headingDirection = "North"
		@xPos = coordinates[0]
		@yPos = coordinates[1]
		@commands = []
	end

	def execute(mvm)
		#
	end

	def unexecute
		#
	end

	def move_forward
		c = GoForward.new(self)
		c.execute
		@commands << c
	end

	def turn_right
		@commands << TurnRight.new(self)
	end

	def turn_left
		@commands << TurnLeft.new(self)
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

	def execute
		case @car.headingDirection
			when "North"
				@yPos += 1
			when "East"
				@xPos += 1
			when "South"
				@yPos -= 1
			when "West"
				@yPos -= 1
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
		if(@directions.index(@headingDirection) < @directions.length - 1)
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
car.report









