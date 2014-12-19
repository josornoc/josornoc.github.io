i = 1

def evalNumber(i)

	isMultiple3 = false;
	isMultiple5 = false;

	if(i.to_i%3 == 0)
		isMultiple3 = true
	end 

	if(i.to_i%5 == 0)
		isMultiple5 = true
	end 

	if(isMultiple5 && isMultiple3)
		return 'fizzBuzz'
	end

	if(isMultiple3)
		return 'fizz'
	end

	if(isMultiple5)
		return 'buzz'
	end

	if(!isMultiple5 && !isMultiple3)
		return i
	end
end

while i <= 100
	puts evalNumber(i)
	i += 1
end