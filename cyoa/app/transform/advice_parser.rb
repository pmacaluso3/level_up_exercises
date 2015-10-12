require 'json'

class AdviceParser
  attr_reader :response

  def initialize(response)
    @response = JSON.parse(response)
  end

  def content
    if response["slip"]
      response["slip"]["advice"]
    else
      "error"
    end
  end

  def make_quote
    if content == "error"
      false
    else
      Quote.new(content: content, ron_said_it: false)
    end
  end
end
