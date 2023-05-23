require_relative 'person' # importing person.rb

# inhering attributes from Person class.
class Student < Person
  attr_reader :classroom # making classroom instance variable accessible.

  def initialize(age, name = 'unknown', parent_permission: true, classroom: nil)
    super(age, name, parent_permission: parent_permission) # initialize with parent behaviour.
    @classroom = classroom # classroom instance variable to be classroom object passed as argument.
  end

  # function to modify classroom object passed in parameters upon initialization.
  def classroom=(classroom)
    @classroom = classroom # set classroom instance variable to new classroom object passed.
    # uppdate Classroom.Students array to have current student oblect
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
