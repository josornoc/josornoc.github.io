class Shortenedurl < ActiveRecord::Base

	validates_presence_of :url

	def initialize
		super
		update_attribute(:short_url, Random.new.rand(999));
		save
	end
end
