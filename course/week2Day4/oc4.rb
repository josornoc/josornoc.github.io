# OC4. IronhackLIST

# Oh, man. We are so proud of our Student class. Validated, short, compact. Is it love?

# Anyway, the thing you probably missed from SL12 is having some web in between. Some routes, some Sinatra, some ERB… so let’s do it, why
# not?

# You will now implement a Ironhack directory of students, that shows a list of everyone’s name, surname, birthday, a clickable link to
# their website, if they have programming experience or not (Yes/No) and, more importantly, ¡the number of dogs they have!

# Apart from that, you should be able to create new students through the interface, and also delete the ones which have 0 dogs (we cannot
# kick the others out, they have dogs!).

# Go for it!

require 'rubygems'
require 'active_record'
require 'sinatra'
require 'sinatra/reloader'

enable :sessions
set :port, 3000
set :bind, '0.0.0.0'

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'students.sqlite'
)

class Student < ActiveRecord::Base
  validates_presence_of :name, :surnames
  validates_format_of :website, with: /\Ahttp:/
  validates_numericality_of :number_of_dogs, greater_than: 0
end

idir = IronhackDirectory.new

get '/' do
	@sList = Student.all
	erb :oc4Index
end

post '/signUp' do
	student = Student.new(name:params[:name],
												surnames:params[:surnames],
												website:params[:website],
												birthday:params[:birthday],
												number_of_dogs:params[:number_of_dogs])
	student.save
	redirect('/')
end

get '/erase_student/:id' do
	puts "*"*30
	puts params[:id]
	puts "*"*30
end


# idir.add_student(params[:name], params[:surnames], params[:website], params[:birthday], params[:number_of_dogs])
# describe Student do
#   before do
#     @student = Student.new
#     @student.name = 'John'
#     @student.surnames = 'Doe'
#     @student.birthday = Date.new(1983,07,03)
#     @student.number_of_dogs = 1
#     @student.website = 'http://ironhack.com'
#     #instance.errors.full_messages`
#   end

#   it "should be valid with correct data" do
#     expect(@student.valid?).to be_truthy
#   end

#   describe :name do
#     it "should be invalid if it's missing" do
#       @student.name = nil
#       expect(@student.valid?).to be_falsy
#     end
#   end

#   describe :surnames do
#     it "should be invalid if it's missing" do
#       @student.surnames = nil
#       expect(@student.valid?).to be_falsy
#     end
#   end
# end
# s1 = Student.new
# s1.name = "Jose"
# s1.surnames = "Bogliol"
# s1.birthday = 20.years.ago
# s1.website = "http://www.ironhack.com"
# s1.number_of_dogs = 1

# s2 = Student.new
# s2.name = "Carlos"
# s2.surnames = "Evangelista"
# s2.birthday = 11.years.ago
# s2.website = "http://www.ironhack.com"
# s2.number_of_dogs = 2

# s3 = Student.new
# s3.name = "Jorge"
# s3.surnames = "Ríos"
# s3.birthday = 99.years.ago
# s3.website = "http://www.ironhack.com"
# s3.number_of_dogs = 3

# idir.add_student(s1)
# idir.add_student(s2)
# idir.add_student(s3)
# class IronhackDirectory
# 	def get_all_students
# 		Student.all
# 	end
# 	def add_student(name, surnames, website, birthday, number_of_dogs)
# 		s = Student.new
# 		s[:name] = name
# 		s[:surnames] = surnames
# 		s[:website]= website
# 		s[:birthday] = birthday
# 		s[:number_of_dogs] = number_of_dogs
# 		s.save
# 	end
# end



