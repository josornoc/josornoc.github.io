class Payroll
	def update( changed_employee )
		puts("Payroll: cut a new check for #{changed_employee.name}!")
		puts("Payroll: His salary is now #{changed_employee.salary}!")
	end
end

class HRemployee
	def update(employee)
		puts "HR: #{employee.name} salary has been changed to #{employee.salary}."
	end   
end 

class Duck
	def update(employee)
		puts "Cuack Cuak"
	end
end

class Employee
  
  attr_reader :name, :title
  attr_reader :salary
  
  def initialize( name, title, salary, payroll)
    @name = name
    @title = title
    @salary = salary
    @payroll = payroll
    @observers = []
  end
  
  def add_observer(observer)
    @observers << observer
  end


  def salary=(new_salary)
    @salary = new_salary
    @observers.each do |employee|
      employee.update(self)
    end
  end 
end


payroll = Payroll.new
hremployee = HRemployee.new
duck = Duck.new

fred = Employee.new('Fred', 'Crane Operator', 30000, payroll)

fred.add_observer(payroll)
fred.add_observer(duck)
fred.add_observer(payroll)
fred.add_observer(duck)
fred.add_observer(hremployee)
fred.add_observer(duck)
fred.add_observer(hremployee)

fred.salary = 35000


