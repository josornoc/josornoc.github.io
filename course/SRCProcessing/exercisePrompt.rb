class ValidateLogin
	def initialize(name, pass)
		if(name == "sean" && pass == "1234")
			puts "You're logged in"
			a = RequestText.new
		end
	end
end

class RequestText
	def initialize
		puts "Enter text to be counted: "
		@text = gets.chomp
		puts "Number of words: "
		arrayOfWords = @text.split(" ")
		puts arrayOfWords.length
	end
end

class RequestInfo
	def initialize
		puts "What is your name: "
		@name = gets.chomp
		puts "Password: "
		@pass = gets.chomp
		validateLogin = ValidateLogin.new(@name, @pass)
	end
end


r = RequestInfo.new
