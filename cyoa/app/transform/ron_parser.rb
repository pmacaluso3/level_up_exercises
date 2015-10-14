require 'csv'

class RonParser
  attr_reader :filename
  attr_accessor :csv_data

  def initialize
    @filename = "#{Rails.root}/public/ron_questions.csv"
    @csv_data = []
    populate_csv_data
  end

  def populate_csv_data
    CSV.foreach(filename) do |line|
      csv_data << line[0]
    end
  end

  def make_question(string)
    Question.new(content: string, ron_said_it: true, type: "Quote")
  end

  def make_all_questions!
    csv_data.each do |string|
      make_question(string).save!
    end
  end
end
