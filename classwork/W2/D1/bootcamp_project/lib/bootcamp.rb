class Bootcamp
    
    def initialize(name, slogan, student_capacity)
        @name = name
        @slogan = slogan
        @student_capacity = student_capacity
        @teachers = []
        @students = []
        @grades = Hash.new{ |hash, k| hash[k] = [] }
    end 

    def name 
        @name
    end 

    def slogan 
        @slogan
    end 
    
    def teachers 
        @teachers
    end 

    def students
        @students
    end 

    def hire(string)
        teachers << string
    end 
    
    def enroll(string)
        if students.length < @student_capacity
            students << string 
            return true 
        elsif students.length == @student_capacity 
            return false 
        end 
    end 

    def enrolled?(string)
        if students.include?(string)
            return true 
        else
            return false 
        end 
    end 

    def student_to_teacher_ratio
        return students.length / teachers.length 
    end

    def add_grade(string, num)
        if students.include?(string)
            @grades[string] << num 
            return true 
        else 
            return false 
        end 
    end
            
    def num_grades(string)
        return @grades[string].length 
    end

    def average_grade(string)
        if !students.include?(string) || @grades[string] == []
            return nil 
        else 
            return (@grades[string].sum)/(@grades[string].length)
        end 
    end
end

