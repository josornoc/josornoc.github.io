require 'pry'

class Calculator
	def add(n1, n2)
		n1 + n2
	end
	def subtract(n1, n2)
		n1 - n2
	end
	def multiply(n1, n2)
		n1 * n2
	end
	def divide(n1, n2)
		n1 / n2
	end
end


#INIT CALCULATOR
calc = Calculator.new

#METHOD TESTING
if (calc.add(1,10) == 11)
	puts "TEST WAS OKAY!!!!"
else 
	puts "TEST FAILED!!!!"
end

if (calc.subtract(10, 9) == 1)
	puts "TEST WAS OKAY!!!!"
else 
	puts "TEST FAILED!!!!"
end

if (calc.multiply(12,12) == 144)
	puts "TEST WAS OKAY!!!!"
else 
	puts "TEST FAILED!!!!"
end

if (calc.divide(100,100) == 1)
	puts "TEST WAS OKAY!!!!"
else 
	puts "TEST FAILED!!!!"
end

binding pry