require_relative "employee.rb"

class Manager < Employee

    attr_reader :employees
    
    def initialize(name, title, salary, boss)
        super(name, title, salary, boss)
        @employees = []
    end 

    def bonus(multiplier)
        total_salary = 0
        arr = employees.dup
        while arr.length > 0
            arr.each do |employee|
                if employee.class == Manager
                    arr += employee.employees
                end
            end
            first = arr.shift 
            total_salary += first.salary
        end
        bonus = (total_salary) * multiplier
    end
end

