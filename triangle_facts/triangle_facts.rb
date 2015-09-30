# Killer facts about triangles AWW YEAH
class Triangle
  attr_reader :side1, :side2, :side3

  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
  end

  def recite_facts
    puts side_length_sentence
    puts angle_sentences
  end

  def calculate_angles(a, b, c)
    angle_a = calculate_single_angle(b, c, a)
    angle_b = calculate_single_angle(c, a, b)
    angle_c = calculate_single_angle(a, b, c)

    [angle_a, angle_b, angle_c]
  end
  
  private
  def equilateral?
    side1 == side2 && side2 == side3
  end

  def isosceles?
    [side1,side2,side3].uniq.length == 2
  end

  def scalene?
    !(equilateral? || isosceles?)
  end

  def side_length_sentence
    if equilateral?
      'This triangle is equilateral!'
    elsif isosceles?
      'This triangle is isosceles! Also, that word is hard to type.'
    elsif scalene?
      'This triangle is scalene and mathematically boring.'
    end
  end

  def right?
    calculate_angles.include?(90)
  end

  def angle_sentences
    if right?
      right = "This triangle is also a right triangle!\n" 
    else
      right = "\n"
    end

    "The angles of this triangle are #{angles.join(',')}\n#{right}"
  end

  # solving for C in a**2 + b**2 - 2abcosC = c**2
  def calculate_single_angle(leg_1, leg_2, opposite_from_angle_of_interest)
    numerator = (leg_1**2 + leg_2**2 - opposite_from_angle_of_interest**2)
    denominator = 2.0*leg_1*leg_2
    angle_in_rads = Math.acos(numerator / denominator)
    radians_to_degrees(angle_in_rads)
  end

  def radians_to_degrees(rads)
    return (rads * 180 / Math::PI).round
  end
end


triangles = [
  [5,5,5],
  [5,12,13],
]
triangles.each { |sides|
  tri = Triangle.new(*sides)
  tri.recite_facts
}
