require_relative 'person'         # importing person.rb

class Student < Person            # inhering attributes from Person class.
  attr_accessor :classroom        # making classroom instance variable accessible.
  def initialize(age, name = 'unknown', parent_permission: true, classroom: nil) 
    super(age, name, parent_permission: parent_permission)    # use parameters to initialize students with super class behaviour.
    @classroom = classroom        # classroom instance variable to be classroom object passed as argument.
  end

  def classroom=(classroom)       # function to modify classroom object passed in parameters upon initialization.
    @classroom = classroom        # set classroom instance variable to new classroom object passed.
    classroom.students.push(self) unless classroom.students.include?(self)    # Uppdate classroom.students array to have current student oblect
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
