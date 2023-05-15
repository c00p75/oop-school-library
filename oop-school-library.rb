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

p1 = Person.new(17)
puts p1.can_use_services?