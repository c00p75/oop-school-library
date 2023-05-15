class Person
  attr_reader :id
  attr_accessor :name, :age
  def initialize(age, name='unknown', parent_permission=true)
    @age, @name, @parent_permission, @id = age, name, parent_permission, Random.rand(1..100)
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def of_age?
    @age >= 18
  end

  private :of_age?
end
