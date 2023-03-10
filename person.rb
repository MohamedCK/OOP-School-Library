require_relative 'nameable'

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id, :rentals

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = generate_id
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
    super()
  end

  # def self.from_h(data)
  #   self.new(data[:id], data[:name], data[:age])
  # end

  def to_h
    {
      age: age,
      name: name
    }
  end

  def add_rentals(rental)
    @rentals << rental
    rental.person = self
  end

  def correct_name
    @name
  end

  def can_use_services?
    return true if of_age? || @parent_permission

    false
  end

  def generate_id
    @id = rand(1...1000)
  end

  private

  def of_age?
    @age >= 18
  end
end

# person = Person.new(22, 'maximilianus')
# person.correct_name
# capitalizedPerson = CapitalizeDecorator.new(person)
# capitalizedPerson.correct_name
# capitalizedTrimmedPerson = TrimmerDecorator.new(capitalizedPerson)
# capitalizedTrimmedPerson.correct_name
