class CharacterParser
  IMAGE_SIZE = "standard_fantastic"

  attr_reader :response, :code, :contents

  def initialize(response)
    @response = response[:data][:results]
    @code = response[:code]
    @contents = contents
  end

  def error_conditions
    code != 200 || response.length == 0
  end

  def contents
    if error_conditions
      "error"
    else
      response.map do |character_data|
        path = character_data[:thumbnail][:path]
        extension = character_data[:thumbnail][:extension]
        image_url = make_image_url(path, extension)
        next if image_url == "http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available/standard_fantastic.jpg"
        {name: character_data[:name], trivia_piece: image_url}
      end
    end
  end

  def contents_without_nil
    contents.reject { |e| e.nil? }  
  end

  def make_image_url(path, extension)
    "#{path}/#{IMAGE_SIZE}.#{extension}"
  end

  def make_characters
    return false if contents == "error"
    contents_without_nil.map { |elem| Character.new(elem) }
    # Character.create!(contents_without_nil)
  end
end
