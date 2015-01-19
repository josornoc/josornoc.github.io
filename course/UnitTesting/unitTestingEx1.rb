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



describe Calculator do

	before do
		@calculator = Calculator.new
	end

	describe "#Add" do
		it "should add 5 and 6" do
			addition = @calculator.add(5,6)
			expect(addition).to eq(11)
		end
		it "should add 1 and 1" do
			addition = @calculator.add(1,1)
			expect(addition).to eq(2)
		end
		it "should add 100 and 1" do
			addition = @calculator.add(100,1)
			expect(addition).to eq(101)
		end
	end

	describe "#subtract" do
		it "should subtract 2 and 2" do
			subtract = @calculator.subtract(2,2)
			expect(subtract).to eq(0)
		end
		it "should subtract 1 and -6" do
			subtract = @calculator.subtract(1,-6)
			expect(subtract).to eq(7)
		end
		it "should subtract 5 and 5" do
			subtract = @calculator.subtract(5,5)
			expect(subtract).to eq(0)
		end
	end

	describe "#multiply" do
		it "should multiply 2 and 2" do
			multiply = @calculator.multiply(2,6)
			expect(multiply).to eq(12)
		end
		it "should multiply 1 and -6" do
			multiply = @calculator.multiply(1,-6)
			expect(multiply).to eq(-6)
		end
		it "should multiply 5 and 5" do
			multiply = @calculator.multiply(5,5)
			expect(multiply).to eq(25)
		end
	end
end

