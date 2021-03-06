class Concert < ActiveRecord::Base

	#validations
	validates :band, presence: true
	validates :band, presence: true
	validates :venue, presence: true
	validates :city, presence: true
	validates :date, presence: true
	validates :price, presence: true, numericality: true
	validates :description, presence: true

	has_many :comments

	def self.get_popular
		
	end
	
	#validates :name, :format => { :with => /[a-zA-Z0-9]*/ } #Check RegExp
	#has_attached_file :logo, styles:{:medium => "300x300>", :thumb => "100x100>"}
	#validates_attachment_content_type :logo, :content_type => /\Aimage\/.*\Z/

	#relationships
	# has_many :entries
	# has_many :participations
	# has_many :people, through: :participations

	#class methods
	# def self.get_by_id(n)
	# 	where("id = ?", n)
	# end

	# def self.clean_old()
	# 	from = Date.today - 1.week
	# 	where("created_at < ?", from).destroy_all
	# end

	# def self.last_created_projects(n)
	# 	order("created_at DESC").limit(n)
	# end

	#instance methods
	# def entries_last_month()
	# 	from = Date.new(Date.today.year, Date.today.month, 1)
	# 	to = Date.new(Date.today.year, Date.today.month, -1)
	# 	entries.where(created_at:from..to)
	# end

	# def entries_by_year_and_month(year, month)
	# 	from = Date.new(year, month, 1)
	# 	to = Date.new(year, month, -1)
	# 	entries.where(created_at:from..to)
	# end	

end
