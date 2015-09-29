class Arrowhead
  CLASSIFICATIONS = {
    far_west: {
      notched: "Archaic Side Notch",
      stemmed: "Archaic Stemmed",
      lanceolate: "Agate Basin",
      bifurcated: "Cody",
    },
    northern_plains: {
      notched: "Besant",
      stemmed: "Archaic Stemmed",
      lanceolate: "Humboldt Constricted Base",
      bifurcated: "Oxbow",
    },
  }

  def self.classify(region, test_shape)
    possible_shapes = CLASSIFICATIONS[region]
    raise "Unknown region, please provide a valid region." if possible_shapes == nil
    if this_shape = possible_shapes.include?(test_shape)
      "You have a(n) '#{this_shape}' arrowhead. Probably priceless."
    end
  end
end

puts Arrowhead.classify(:northern_plains, :bifurcated)
puts Arrowhead.classify(:southwest, :notched)
