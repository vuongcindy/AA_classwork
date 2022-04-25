require 'byebug'
class Bootcamp
  # Part 1
  def initialize(name, slogan, student_capacity)
    @name = name
    @slogan = slogan
    @student_capacity = student_capacity
    @teachers = []
    @students = []
    @grades = Hash.new { |h, k| h[k] = []}

    def name
      @name
    end

    def slogan
      @slogan
    end

    def student_capacity
      @student_capacity
    end

    def teachers
      @teachers
    end

    def students
      @students
    end

    def grades
      @grades 
    end

    def hire(teacher)
      @teachers << teacher
    end

    def enroll(student)
      if @students.length < @student_capacity
        @students << student
        return true
      else
        return false
      end
    end

    def enrolled?(student)
      if @students.include?(student)
        return true
      else
        return false
      end
    end

    # Part 2
    def student_to_teacher_ratio
      return @students.length / @teachers.length
    end

    def add_grade(student, grade)
      if enrolled?(student)
        @grades[student] << grade
        return true
      else
        return false
      end
    end

    def num_grades(student)
      return @grades[student].length
    end

    def average_grade(student)
      grade_points = 0
      if num_grades(student) == 0 || !enrolled?(student) 
        return nil
      end
      # @grades hash is {student_name: grades}
      @grades[student].each do |each_grade|
        # debugger
        grade_points += each_grade
      end
      p grade_points
      p num_grades(student)
      p grade_points / num_grades(student)
      p "---"
      return grade_points / num_grades(student)
    end
    
  end
end
