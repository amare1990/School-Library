require './person'

class Teacher < Person
  def initialize(age, parent_permission, name, specialization)
    super(name, age, parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
