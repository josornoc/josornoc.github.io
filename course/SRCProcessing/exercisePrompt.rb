class ValidateLogin

	def initialize(name, pass)
		@name = name
		@pass = pass
		@users = []
		readAvailableUsers
		tryLogIn
	end

	def readAvailableUsers

		@usersDb = IO.read('users.txt')

		@usersDb.each_line do |line|
			tmp = line.split(",")
			tmp[1] = tmp[1].split("\n").join("")
			@users << {userName:tmp[0], userPass:tmp[1]}
		end
	end

	def tryLogIn
		@users.each do |user|
			if user[:userName] == @name && user[:userPass] == @pass
				puts " --- user and pass corrent - Logued in - Welcome #{user[:userName]} --- "
				a = RequestText.new
				return
			else
				puts " --- user and pass not founded --- "
			end
		end
	end
end

class RequestText

	def initialize
		
		puts "Enter text to parse: "
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

class RequestInfo
	def start
		puts "What is your name: "
		@name = gets.chomp
		puts "Password: "
		@pass = gets.chomp
		validateLogin = ValidateLogin.new(@name, @pass)
	end
end

r = (RequestInfo.new).start






