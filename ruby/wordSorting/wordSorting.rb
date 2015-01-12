def sortWords(str)
	str = str.gsub(/[^a-z0-9\s]/i, '')
	words = str.split(" ")
	words = compareWords(words)
end

def compareWords(strArr)
	strArr = strArr.sort_by{|word| word.downcase}
end

def wordOrganizer()
	puts "Enter the phrase to organize the words ignoring case...."
	puts sortWords(gets.chomp.to_s)
end

wordOrganizer()