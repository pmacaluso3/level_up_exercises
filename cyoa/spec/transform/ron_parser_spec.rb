require 'rails_helper'

describe RonParser do
  let(:ron_parser) { described_class.new }

  it 'has an array of strings' do
    expect(ron_parser.csv_data).to be_a(Array)
    expect(ron_parser.csv_data[0]).to be_a(String)
  end

  it 'makes a question object out of each string' do
    expect(ron_parser.make_question("I'm Ron")).to be_a(Question)
  end

  it 'makes a question that ron said' do
    expect(ron_parser.make_question("I'm Ron").ron_said_it).to be true
  end

  it 'writes all new questions to the database' do
    Question.destroy_all
    ron_parser.make_all_questions!
    expect(Question.count).to eq(ron_parser.csv_data.length)
    Question.destroy_all
  end
end
