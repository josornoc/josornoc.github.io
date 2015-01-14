class User

	attr_reader :email, :fb, :twitter

	def initialize(name, email = nil, fb = nil, twitter = nil)
		@name = name
		@email = email
		@fb = fb
		@twitter = twitter
	end
end

class NotificationFactory

	def self.for_user(user)

		if(!user.email.nil?)
			return EmailNotificator.new
		end
		if(!user.fb.nil?)
			return FBNotificator.new
		end
		if(!user.twitter.nil?)
			return TwitterNotificator.new
		end
	end
end

class EmailNotificator
	def send_message(msg)
		puts "email notif: " + msg
	end
end

class FBNotificator
	def send_message(msg)
		puts "FB notif: " + msg
	end
end

class TwitterNotificator
	def send_message(msg)
		puts "Twitter notif: " + msg
	end
end


myUser = User.new("pepe", nil, nil, "@twitter user for pepe")

notificator = NotificationFactory.for_user(myUser)

notificator.send_message("Hello")







