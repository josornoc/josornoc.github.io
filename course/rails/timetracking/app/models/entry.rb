class Entry < ActiveRecord::Base
	validates :hours, presence: true
	validates :minutes, presence: true
	validates :date, presence: true
	validates :hours, numericality: { only_integer: true }
	validates :minutes, numericality: { only_integer: true }
	
	belongs_to :project
end
