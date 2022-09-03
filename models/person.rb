require_relative './nameable'
require_relative './decorators/base_decorator'
require_relative './decorators/capitalize_decorator'
require_relative './decorators/trimmer_decorator'

class Person < Nameable
  attr_accessor :age, :name
  attr_reader :id, :rentals

  def initialize(age, name = 'Unknown', id = nil, parent_permission: true)
    super()
    @age = age
    @name = name
    @parent_permission = parent_permission
    @rentals = []
    @id = id || ((rand * 100_000) + (rand * 100_000)).ceil
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  private

  def of_age?
    @age >= 18
  end
end
