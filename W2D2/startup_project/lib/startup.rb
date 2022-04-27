require "employee"
require 'byebug'

class Startup
    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end

    def name
        @name
    end

    def funding
        @funding
    end

    def salaries
        @salaries
    end

    def employees
        @employees
    end

    def valid_title?(title)
        if salaries.has_key?(title)
            return true
        else
            return false
        end
    end

    def >(another_startup)
        if self.funding > another_startup.funding
            return true
        else
            return false
        end
    end

    def hire(employee_name, title)
        if !valid_title?(title)
            raise ArgumentError.new "title doesn't exist"
        else
            new_employee = Employee.new(employee_name, title)
            employees << new_employee
        end
    end

    def size
        employees.length
    end

    def pay_employee(employee)
        salary = salaries[employee.title]
        if @funding >= salary
            @funding -= salary
            employee.pay(salary)
        else
            raise StandardError
        end
    end

    def payday
        employees.each do |employee|
            pay_employee(employee)
        end
    end

    def average_salary
        sum_of_salaries = 0
        employees.each do |employee|
            # debugger
            sum_of_salaries += pay_employee(employee)
        end
        sum_of_salaries / employees.length
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(another_startup)
        @funding += another_startup.funding

        another_startup.salaries.each do |title, salary|
            if !salaries.has_key?(title)
                salaries[title] = salary
            end
        end
   
        another_startup.employees.each do |employee|
            employees << employee
        end

        another_startup.close
    end
end
