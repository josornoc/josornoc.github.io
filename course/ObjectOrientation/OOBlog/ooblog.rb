require 'date';

class Blog

	def initialize
		@posts = []
	end

	def add_post(title, date, text, isSponsored = false)
		@posts << { 'title' => title, 'date' => date, 'text' => text, 'isSponsored' => isSponsored }
	end

	def front_page

		@posts.sort_by { |k| k["date"].strftime('%Q').to_i}
		@posts = @posts.reverse

		@posts.each do |post|
			if(post['isSponsored'])
				puts "*****" + post['title'] + "*****" + ' /// Added on: ' + post['date'].to_s 
			else
				puts post['title'] + ' /// Added on: ' + post['date'].to_s 
			end
			puts '***************'
			puts post['text']
			puts '---------------'
		end
	end
end


#DRIVER CODE
b = Blog.new;

b.add_post('Post Title 1', DateTime.now, 'Post 1 text');
b.add_post('Post Title 2', DateTime.now, 'Post 2 text', true);
b.add_post('Post Title 3', DateTime.now, 'Post 3 text');

b.front_page;