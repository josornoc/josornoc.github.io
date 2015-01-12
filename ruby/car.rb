class Car

	def self.cars_created
		IO.read("cars_created.txt").to_i
	end

	def initialize(noise) # def initialize( noise = "Default value" )
		@noise = noise
		number = IO.read("cars_created.txt").to_i + 1
		IO.write("cars_created.txt", number)
	end

	def noise
		puts @noise
	end

	def get_noise
		@noise
	end
end

class RacingCar < Car

	def initialize
		super("BRROOOM")
	end
end

sounds = ["Broom", "Meek", "Nyan"]
cars = []

cars = sounds.map { |item| Car.new(item) }

cars.each do |car|
	car.noise
end

#cars2 = sounds.each_with_object({}) do |sound, memo|
#	memo[sound] = Car.new(sound)
#end

puts cars.reduce(""){ |sound, car| sound + car.get_noise }			# whatch out with first element always when reducing...
