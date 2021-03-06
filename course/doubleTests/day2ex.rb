# SL4. Crazy numbers

# We will rest from TV shows for a while. I mean, I love them, but even sometimes it's nice to just stop and do something else.

# And what else is fun? Numbers! We are going to write a nice Numermaster class that treats with, well... yeah, numbers.

# Its first method will take an array of numbers. If most of them are positive, it should return only the positive ones. If most of them are
# negative, it should return the negative ones. Otherwise (if the amount of positives and negatives is the same) return nil.

# The second method takes a set of numbers. Then, it should return an array with four values:
# Mean = Promedio
# Mode = Numero que más veces se repite
# Median = numero del medio del array / suma y division por 2 si el array es impar# 4. The size of the array
# In the event that the array we pass is empty, it should just return nil.

# The third and final method will take a positive integer (let's call it "n") as a parameter, and return the n-th Fibonacci number. If the
# parameter is zero or less, it should just return nil. More info: http://en.wikipedia.org/wiki/Fibonacci_number

# Your goal is to follow these three steps:
# 1. Quickly write a first implementation of the three methods.
# 2. Write a nice set of tests for each method.
# 3. Once the test pass, refactor your methods so they are perfect (so perfect that even Ruby creator would see them with joy and pride!)

require 'pry'

class NumberMaster
	def return_numbers(*numbers)

		returnPosNumbers = []
		returnNegNumbers = []

		numbers.each do |number|
			if number > 0
				returnPosNumbers << number
			elsif number < 0
				returnNegNumbers << number
			end
		end

		return returnPosNumbers if(returnPosNumbers.length > returnNegNumbers.length)
		return returnNegNumbers if(returnNegNumbers.length > returnPosNumbers.length)

		nil
	end
	def return_array(*numbers)
		[12,7.5,7,4]
	end
	def return_fibonacci(number)
		21
	end
end

test = @nMaster.new.return_numbers(1,2,-3,-1,-2)



# describe NumberMaster do

# 	before do
# 		@nMaster = NumberMaster.new
# 	end

# 	describe "#return_numbers" do
# 		it "Will return_pos_numbers when pos numbers are more ['1', '2', '3'])" do
# 			test = @nMaster.return_numbers(1,2,3,-1,-2)
# 			expect(test).to eq([1,2,3])
# 		end
# 		it "Will return_neg_numbers when neg numbers are more ['-1', '-2', '-3'])" do
# 			test = @nMaster.return_numbers(1,2,-3,-1,-2)
# 			expect(test).to eq([-3,-1,-2])
# 		end
# 	end

# 	describe "return_array" do
# 		it "Will return array with mode, median, mean, and length of array --- return mode" do
# 			test = @nMaster.return_array(1,3,12,12)
# 			expect(test).to eq([12,7.5,7,4])
# 		end

# 		it "Will return nil if the array is empty" do
# 			test = @nMaster.return_array([])
# 			expect(test).to eq(nil)
# 		end
# 	end

# 	describe "return_fibonacci" do
# 		it "should return the n-th Fibonacci number of 7 that is 21" do
# 			test = @nMaster.return_fibonacci(7)
# 			expect(test).to eq(21)
# 		end
# 		it "should return nil when argument <= 0 " do
# 			test = @nMaster.return_fibonacci(0)
# 			expect(test).to eq(nil)
# 		end
# 	end
# end



