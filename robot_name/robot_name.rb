class NameCollisionError < RuntimeError; end

class Robot
  attr_accessor :name

  @@registry

  def initialize(args = {})
    @@registry ||= []
    @name_generator = args[:name_generator] || NameGenerator.new

    generate_unique_name

    # I think this error is unneccessary, but it was included in the original code
    if name_invalid?
      raise NameCollisionError, 'There was a problem generating the robot name!'
    end

    add_name_to_registry
  end

  def generate_unique_name
    loop do 
      # raise NameCollisionError
      # the instructions said to make it more robust in case of a collision error
      @name = @name_generator.generate_name
      break if name_available?
    end
  end

  def add_name_to_registry
    @@registry << @name
  end

  def name_available?
    !(@@registry.include?(name))
  end

  def name_invalid?
    !(name =~ /[a-zA-Z]{2}[\d]{3}/)
  end
end

class NameGenerator
  def generate_char
    ('A'..'Z').to_a.sample
  end

  def generate_num
    rand(10).to_s
  end

  def generate_name
    output_name = ""
    2.times { output_name += generate_char }
    3.times { output_name += generate_num }
    output_name
  end
end

robot = Robot.new
puts "My pet robot's name is #{robot.name}, but we usually call him sparky."

# Errors!
# generator = -> { 'AA111' }
# Robot.new(name_generator: generator)
# Robot.new(name_generator: generator)
