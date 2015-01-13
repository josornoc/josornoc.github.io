class CarTransport

	include Enumerable

	def initialize
		@cars = []
	end

	def << (car)
		@cars << car
	end

	def show_cars

		@cars = @cars.sort_by { |car| car.noise.length }.reverse

		@cars.each do |car|
			puts car.noise
		end
	end

	def each(&block)
		@cars.each(&block)
	end
end


class Car

	attr_reader :noise

	def initialize(noise)
		@noise = noise
	end

	def <=>(other_car)
		@noise.length <=> other_car.noise.length
	end
end




myCarTransport = CarTransport.new

myCarTransport << Car.new("Hooooonk")
myCarTransport << Car.new("Fang!")
myCarTransport << Car.new("Rumbleeeeee")

#myCarTransport.show_cars

puts myCarTransport.max.noise

# myCarTransport.each do |e|
# 	puts e.noise
# end








