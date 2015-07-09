class Dinosaur
  attr_reader :name, :period, :continent, :diet, :weight_in_lbs, :walking, :description

  def initialize(args={})
    @name = args[:name]
    @period = args[:period]
    @continent = args[:continent]
    @diet = args[:diet]
    @weight_in_lbs = args[:weight_in_lbs]
    @walking = args[:walking]
    @description = args[:description]

    validate_weight!(@weight_in_lbs)
    validate_description!(@description)
  end

  def is_carnivore?
    @diet != "Herbivore" && @diet != nil
  end

  def is_biped?
    @walking == "Biped"
  end

  def to_json
    dinosaur = {
      name: @name,
      period: @period,
      continent: @continent,
      diet: @diet,
      weight_in_lbs: @weight_in_lbs,
      walking: @walking,
      description: @description
    }
    dinosaur.to_json
  end

  def to_s
    puts "Name: #{name}" unless @name == nil
    puts "Period: #{period}" unless @period == nil
    puts "Continent: #{continent}" unless @continent == nil
    puts "Diet: #{diet}" unless @diet == nil
    puts "Weight: #{weight_in_lbs}" unless @weight_in_lbs == nil
    puts "Walking Style: #{walking}" unless @walking == nil
    puts "Brief Description: #{description}" unless @description == nil
    puts
  end

  private

  def validate_weight!(weight)
    if weight != nil && !(weight.is_a? Integer)
      raise "Weight must be an integer!"
    end
  end

  def validate_description!(desc)
    if desc != nil && desc == ""
      raise "The description cannot be an empty string!"
    end
  end
end
