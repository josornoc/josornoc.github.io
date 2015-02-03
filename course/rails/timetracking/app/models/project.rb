class Project < ActiveRecord::Base

	validates_presence_of :name
	has_many :entries

	def self.get_by_id(n)
		where("id = ?", n)
	end

	def self.clean_old()
		from = Date.today - 1.week
		where("created_at < ?", from).destroy_all
	end

	def self.last_created_projects(n)
		order("created_at DESC").limit(n)
	end
end
