# 1. First, add tests for each one of the validations we have. Check that if we don’t have a name for a student then the student is not valid,
# same for surnames; also check that if we have an 11 year old student we won’t accept him (yet), and so on.
# 2. Add a “complete_name” method, but with the help of TDD. Remember: add the tests about the behaviour, then the tests will fail, and
# finally just implement the method and all tests will pass again.
# 3. Once all the specs pass add some more validations of your own. For example, we won’t accept students born before 1970 that have more
# than one dog, and we also won’t accept students which have “Xavier” name, because we want him to be the only Xavier in Ironhack <3 (repeat
# the same with “Nick”, because we love him starting at us doing yoga)
# 4. Finally, remove all the ActiveRecord validations and implement them on your own with the “validate” DSL method. Let’s go, folks!
# Note: you will find a student.rb template file and the student.sqlite database in Slack.

require 'rubygems'
require 'active_record'

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'students.sqlite'
)

class Student < ActiveRecord::Base

  # we have name, surnames, birthday, website, number_of_dogs
  # and first_programming_experience

  AGE_MINIMUM = 16
  AGE_MAXIMUM = 34

  validates_presence_of :name, :surnames
  validates_format_of :website, with: /\Ahttp:/
  validates_numericality_of :number_of_dogs, greater_than: 0
  validate :proper_age
  validate :name_xavier

  def complete_name
    name.to_s + " " + surnames.to_s
  end

  private
  def name_xavier
    unless name != "Xavier"
      errors.add(:name, 'the student has an awful name')
    end
    unless name != "Nick"
      errors.add(:name, "We only want 1 Nick")
    end
  end

  def proper_age
    unless birthday < AGE_MINIMUM.years.ago
      errors.add(:birthday, 'is too young')
    end
    unless birthday > AGE_MAXIMUM.years.ago && number_of_dogs
      errors.add(:birthday, 'student is too old and its weird (too much dogs)')
    end
  end
end


describe Student do
  before do
    @newStudent = Student.new
  end
  describe ":name" do
    it "Should be invalid if missing" do
      (@newStudent.isValid?).to be_truthy
    end
  end
end



