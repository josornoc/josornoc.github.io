def replaceChars str, num
	rString = ""
	str.split("").each do |letter|
		rString << (letter.ord + num).chr 
	end
	return rString
end

def encodeStr str, num

	puts "Original: #{str}"

	a = str.split(" ")
	aReturn = []

	a.each do |word|
		aReturn << replaceChars(word, num)
	end

	aReturn = aReturn.join(" ")
	puts "Result: #{aReturn}"
end

def requestMsgToCod
	puts "Write a String to codify:"
	msn = gets.chomp.to_s
	puts "Write the number to shift character (< 0 to go left, > 0 to go right):"
	num = gets.chomp.to_i

	if(num < -75 || num > 100)
		puts "nummber out of bounds, default -3"
		num = -3
	end

	encodeStr(msn, num)
	requestMsgToCod();
end

requestMsgToCod();