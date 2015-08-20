class Person
  def initialize(name)
    @name = name
  end  

  def greet
    puts "Hi, my name is #{@name}."
  end
end 

class Student < Person
  def learn
    puts "I get it!"
  end
end

class Instructor < Person
  def teach
    puts "Everything in Ruby is an Object."
  end
end

instructor_1 = Instructor.new("Chris")
instructor_1.greet

student_1 = Student.new("Christina")
student_1.greet

instructor_1.teach
student_1.learn

#This line doesn't work because 'teach' is defined only in Instructor so the instance of 
#class 'Student' can't invoke this method.
student_1.teach