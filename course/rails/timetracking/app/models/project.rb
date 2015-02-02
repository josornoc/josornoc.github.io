class Project < ActiveRecord::Base

	validates_presence_of :name, :description

	def self.get_by_id(n)
		where("id = ?", n)
	end

	def self.clean_old()
		from = Date.today - 1.week
		where("created_at < ?", from).destroy_all
	end
end
