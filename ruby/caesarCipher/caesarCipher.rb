def replace_chars(str, num)
	rString = ""
	str.split("").each do |letter|
		rString << (letter.ord + num).chr 
	end
	rString
end

def encode_str(str, num)
	a = str.split(" ")
	aReturn = []
	a.each do |word|
		aReturn << replace_chars(word, num)
	end
	aReturn = aReturn.join(" ")
	"Original: #{str} /// Result: #{aReturn}"
end

def msg_to_cod(msn, num)
	if(num < -75 || num > 100)
		raise "nummber out of bounds, default -3"
		num = -3
	end
	encode_str(msn, num)
end

puts "Write a String to codify:"
msn = gets.chomp.to_s
puts "Write the number to shift character (< 0 to go left, > 0 to go right):"
num = gets.chomp.to_i
puts msg_to_cod(msn, num);