class Classroom
  attr_accessor :label, :students   # Access lable and students instance variables.

  def initialize(label)
    @label, @students = label, []   # Initialize lable to store classroom lable and students array to store student objects.
  end

  def add_student(student)          # Define function to add student to Classroom students array.
    @students << student            # Add passed student object to array.
    student.classroom = self        # Add this Classroom object to classroom instance variable in student object.
  end
end