10.times.each do |i|
	p = Shortenedurl.new
	p.url = "http://www.google.com"
	p.clicks_num = 0
	p.save
end