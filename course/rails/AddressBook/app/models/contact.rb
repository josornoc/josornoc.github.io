class Contact < ActiveRecord::Base
	#validations
	validates :name, presence: true
	validates :name, length: { maximum: 30 }
	validates :name, :format => { :with => /[a-zA-Z0-9]*/ } #Check RegExp
	validates :address, presence: true
	#relationships
	has_many :phones
	has_many :emails
end
