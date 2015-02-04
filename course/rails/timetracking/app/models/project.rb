class Project < ActiveRecord::Base

	#validations
	validates :name, presence: true
	validates :name, uniqueness: true
	validates :name, length: { maximum: 30 }
	#validates :name, :format => { :with => /^[a-zA-Z0-9{0,40}-_]+$/ } #Check RegExp

	#relationships
	has_many :entries

	#class methods
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

	#instance methods
	def entries_last_month()
		from = Date.new(Date.today.year, Date.today.month, 1)
		to = Date.new(Date.today.year, Date.today.month, -1)
		entries.where(created_at:from..to)
	end

	def entries_by_year_and_month(year, month)
		from = Date.new(year, month, 1)
		to = Date.new(year, month, -1)
		entries.where(created_at:from..to)
	end
end