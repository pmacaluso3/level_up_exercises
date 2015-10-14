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

  def make_question
    if content == "error"
      false
    else
      Question.new(content: content, name: "advice", type: "Quote")
    end
  end
end
