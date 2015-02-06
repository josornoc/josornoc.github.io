class Comment < ActiveRecord::Base
	validates :name, presence: true
	validates :text, presence: true
	belongs_to :concert
end
