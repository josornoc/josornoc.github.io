class Car
	def initialize(noise, engine)
		@noise = noise
		@engine = engine
	end

	def make_noise
		puts @noise + (" ") + @engine.noise
		
	end
end

class Engine
	attr_reader :noise
	def initialize(noise)
		@noise = noise
	end
end

my_car = Car.new("RUN", Engine.new("BANBAN"))
my_car.make_noise 


class Dog
	attr_reader :noise
	def initialize
		@noise = ("guau guau")
		
	end

end

my_car = Car.new("RUN", Dog.new)
my_car.make_noise 