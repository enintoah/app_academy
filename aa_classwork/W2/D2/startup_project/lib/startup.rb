require "employee"

class Startup
    attr_reader :name, :salaries
    attr_accessor :funding, :employees
    def initialize(name, funding, salaries)
        @name = name 
        @funding = funding 
        @salaries = salaries 
        @employees = []
    end 

    def valid_title?(title)
        salaries.has_key?(title) 
    end 

    def >(startup)
       return true if self.funding > startup.funding
       return false if self.funding <= startup.funding
    end 

    def hire(name, title)
        if !valid_title?(title)
            raise "title does not exist"
        else 
            employee_name = Employee.new(name, title)
            @employees << employee_name
        end 
    end

    def size
        employees.length
    end 

    def pay_employee(employee)
        amount_due = salaries[employee.title]
        if funding >= amount_due
            employee.pay(amount_due)
            @funding -= amount_due 
        else 
            raise "not enough money"
        end
    end

    def payday 
        employees.each do |employee|
            self.pay_employee(employee)
        end 
    end 

    def average_salary
        sum = 0 
        employees.each do |ele|
            sum += salaries[ele.title]  
        end 
        return sum / employees.length 
    end 

    def close
        @employees = []
        @funding = 0 
    end 

    def acquire(startup)
        @funding += startup.funding
        startup.salaries.each do |k, v| 
            if !valid_title?(k)
                @salaries[k] = v
            end 
        end 
        @employees += startup.employees
        startup.close
    end 
end
