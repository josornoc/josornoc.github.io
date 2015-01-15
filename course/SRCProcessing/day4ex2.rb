class Dummy
	def method_missing(m, *args, &block)
		puts "There is not method called - #{m} here ---- #{args.size}"
		args.each do |a|
			puts a
		end
	end
end

d = Dummy.new

d.myMethod(1, "jose", "anotherString")