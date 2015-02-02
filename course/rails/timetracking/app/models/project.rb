class Project < ActiveRecord::Base

	validates_presence_of :name, :description

	def self.get_by_id(n)
		where("id = ?", n)
	end
end
