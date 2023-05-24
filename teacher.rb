require_relative 'person'

class Teacher < Person
  attr_accessor :specialization

  attr_writer :id

  def initialize(age, specialization, name = 'unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
