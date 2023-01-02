require './person'

class Student < Person
  def initialize(age, parent_permission, name, classroom)
    super(name, age, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
