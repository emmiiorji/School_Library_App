require_relative 'person'

class Student < Person
  def initialize(age, classroom, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def plan_hooky
    '¯\(ツ)/¯'
  end
end
