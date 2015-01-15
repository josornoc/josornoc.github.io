class MyHash

	def initialize
		@args = {}
	end

	def method_missing(m, *args, &block)
		if(args.size > 0)
			@args[m] = args
		else
			@args.each do |a|
				a
			end
		end
	end
end

mh = MyHash.new
mh.hello(2)
mh.hello(4)
mh.hello(6)
mh.hello(8)
puts mh.hello
