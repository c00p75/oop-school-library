class Person
  attr_reader :id
  attr_accessor :name, :age
  def initialize(age, name='unknown', parent_permission=true)
    @age, @name, @parent_permission = age, name, parent_permission
  end

  def can_use_services?
    self.of_age? || @parent_permission
  end

  private
  def of_age?
    @age >= 18
  end
end

class Student < Person
  def initialize(age, name, parent_permission, classroom)
    super(age, name, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end

class Teacher < Person
  def initialize(age, name, parent_permission, specialization)
    super(age, name, parent_permission)
    @specialization = specialization
  end

  def can_use_services? 
    true
  end
end

p1 = Teacher.new(41, 'Bill', true, 'Math')
puts p1.can_use_services?