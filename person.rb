class Person
  def initialize (name ="Unknown", age, parent_permission = true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
  end

  def id
    @id
  end

  def name
    @name
  end

  def age
    @age
  end

  def name = (name_value)
    @name = name_value
  end

  def age = (value)
    @age = value
  end

  private
  def is_of_age?
    @age >= 18 ? true: false
  end

  def can_use_services?
    if this.is_of_age? or @parent_permission
      return true
    return false
    end
  end


end
