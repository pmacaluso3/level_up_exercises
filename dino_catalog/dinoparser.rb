class DinoParser
  attr_reader :files, :dinosaurs

  def initialize(files = [])
    @files = files
    @dinosaurs = []
  end

  def add(dino)
    @dinosaurs << dino
  end

  def find_bipeds
    @dinosaurs.select{ |dino| dino.is_biped? }
  end

  def find_carnivores
    @dinosaurs.select{ |dino| dino.is_carnivore? }
  end

  def find_by_period(era)
    @dinosaurs.select{ |dino| dino.period.include? era }
  end

  def find_by_size!(size)
    if size.downcase == "big"
      @dinosaurs.select{ |dino| dino.weight_in_lbs != nil && dino.weight_in_lbs > 2000 }
    elsif size.downcase == "small"
      @dinosaurs.select{ |dino| dino.weight_in_lbs != nil && dino.weight_in_lbs <= 2000 }
    else
      raise "That's not an acceptable input!"
    end
  end

  def load_dinosaurs
    @files.each { |file| parse_dinosaurs(file) }
  end

  def save(filename)
    unless File.exist?(filename)
      File.new(filename, "w+")
    end
    CSV.open(filename, "w") do |csv|
      @dinosaurs.each do |dino|
        csv << [dino.name, dino.period, dino.continent, dino.diet, dino.weight_in_lbs, dino.walking, dino.description]
      end
    end
  end

  def to_json
    @dinosaurs.each { |dino| dino.to_json }
  end

  private
  def standardize(args={})
    standard_keys = {
      :name => args[:name] || args[:genus],
      :period => args[:period],
      :continent => args[:continent],
      :diet => args[:diet] || args[:carnivore],
      :weight_in_lbs => args[:weight_in_lbs] || args[:weight],
      :walking => args[:walking],
      :description => args[:description]
    }

    clean_diet(standard_keys)
    clean_weight(standard_keys)
    clean_description(standard_keys)

    standard_keys
  end

  def clean_diet(keys={})
    case keys[:diet]
    when "Yes"
      keys[:diet] = "Carnivore"
    when ""
      keys[:diet] = nil
    else
      keys[:diet] = keys[:diet]
    end
  end

  def clean_weight(keys={})
    case keys[:weight_in_lbs]
    when ""
      keys[:weight_in_lbs] = nil
    when nil
      keys[:weight_in_lbs] = nil
    when 0
      keys[:weight_in_lbs] = nil
    else
      keys[:weight_in_lbs] = keys[:weight_in_lbs].to_i
    end
  end

  def clean_description(keys={})
    case keys[:description]
    when ""
      keys[:description] = nil
    else
      keys[:description] = keys[:description]
    end
  end

  def parse_dinosaurs(file)
    CSV.foreach(file, headers: true, header_converters: :symbol) do |row|
      @dinosaurs << Dinosaur.new(standardize(row))
    end
  end
end
