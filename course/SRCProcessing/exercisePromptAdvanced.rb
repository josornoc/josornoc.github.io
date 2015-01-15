class ValidateLogin
	def initialize(name, pass)
		if(name == "sean" && pass == "1234")
			puts "You're logged in"
			a = RequestText.new
		else
			puts "LIAR!!!!"
		end
	end
end

class RequestText
	def initialize
		puts "Enter text: "
		@text = gets.chomp
		myParseCLASS = ParseText.new(@text)
		
		puts "What would you like to do?"
		puts "1. Count Words"
		puts "2. Count Letters"
		puts "3. Reverse Text"
		puts "4. Convert the text to upper case."
		puts "5. Convert the text to lower case."

		@number = gets.chomp.to_i

		case @number
		when 1
			myParseCLASS.count_words
		when 2
			myParseCLASS.count_letters
		when 3
			myParseCLASS.reverse_text
		when 4
			myParseCLASS.upper_case
		when 5	
			myParseCLASS.lower_case
		else
			puts "You're a clown!"
		end
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

class CountWords
	def initialize(text)
		@text = text
		execute
	end
	def execute
		@arrayOfWords = @text.split(" ")
	end
end


class ParseText
	def initialize(text)
		@text = text
		@arrayOfWords = @text.split(" ")
	end
	def count_words
		puts "Number of words: "
		puts @arrayOfWords.length
	end
	def count_letters
		puts "The number of letters is "
		puts @text.length - @arrayOfWords.length + 1
	end
	def reverse_text
		puts "The reverse of the text is "
		puts @text.reverse
	end
	def upper_case
		puts "The text in upper case is "
		puts @text.upcase
	end
	def lower_case
		puts "The text in lower case is "
		puts @text.downcase
	end
end

r = RequestInfo.new






