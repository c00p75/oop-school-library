class Classroom
  attr_accessor :label, :students # Access lable and students instance variables.

  def initialize(label)
    @label = label
    @students = [] # Initialize lable to store classroom lable and students array to store student objects.
  end

  # Define function to add student to Classroom students array.
  def add_student(student)
    @students << student # Add passed student object to array.
    student.classroom = self # Add this Classroom object to classroom instance variable in student object.
  end
end
