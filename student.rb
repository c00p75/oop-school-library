require_relative 'person'

class Student < Person
  def initialize(age, classroom, name = 'unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end

p1 = Student.new(41, 'LT1')
puts p1.can_use_services?, p1.age, p1.name, p1.parent_permission
