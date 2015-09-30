class NameCollisionError < RuntimeError; end
class InvalidNameError < RuntimeError; end

class Robot
  attr_accessor :name
  attr_reader :default_name_generator, :name_generator

  @@registry

  def initialize(args = {})
    @@registry ||= ["AB123"]
    @name_generator = args[:name_generator] || DefaultNameGenerator.new
    @default_name_generator = DefaultNameGenerator.new

    generate_unique_name

    unless name_valid?
      raise InvalidNameError, 'There was a problem generating the robot name!'
    end

    add_name_to_registry
  end

  def generate_unique_default_name
    loop do 
      self.name = default_name_generator.call
      break if name_available?
    end
  end

  def generate_unique_name
    begin
      self.name = name_generator.call
      unless name_available?
        p "Attempted to use name #{name}, but it was taken"
        raise NameCollisionError, "That name is already taken"
      end
    rescue NameCollisionError
      generate_unique_default_name
    end
  end

  def add_name_to_registry
    @@registry << name
  end

  def name_available?
    !@@registry.include?(name)
  end

  def name_valid?
    name =~ /[a-zA-Z]{2}[\d]{3}/
  end
end

class DefaultNameGenerator
  def generate_char_lambda
    -> { ('A'..'Z').to_a.sample }
  end

  def generate_num_lambda
    -> {rand(10).to_s }
  end

  def call
    output_name = ""
    2.times { output_name += generate_char_lambda.call }
    3.times { output_name += generate_num_lambda.call }
    output_name
  end
end


robot = Robot.new
puts "My pet robot's name is #{robot.name}, but we usually call him sparky."

# Handled with generat_unique_name
generator = -> { 'AA111' }
Robot.new(name_generator: generator)
Robot.new(name_generator: generator)

# Should raise InvalidNameError
bad_generator = -> { "AB" }
Robot.new(name_generator: bad_generator)