# class Car
	
# 	def initialize(noise = @noise)
# 		@noise = noise
# 	end

# 	def honk
# 		puts @noise
# 	end
# end

# car1 = Car.new("honk honk!").honk;
# car2 = Car.new("Brooooooooom!").honk;


# ["carrots", "apples", "oranges"].each do |item|
# 	puts item
# end

#a = [1,2,3].reduce(0){|sum, x| sum + x}

#puts a;

a = ["carrots", "apples", "oranges"].reduce(){|s, item| item + s};

puts a;