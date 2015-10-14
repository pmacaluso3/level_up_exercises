require 'rails_helper'

describe AdviceParser do
  let(:non_error_slip) { '{"slip": {"advice":"Here is some advice"}}' }
  let(:error_slip) { '{"message": {"type": "error", "text": "Advice slip not found."}}' }

  context 'with an error slip' do
    let(:question) { described_class.new(error_slip).make_question }

    it '#make_question should return false for an error slip' do
      expect(question).to be false
    end
  end

  context 'with a non-error slip' do
    let(:question) { described_class.new(non_error_slip).make_question }

    it 'makes a question out of a non-error slip with the correct content' do
      expect(question).to be_a(Question)
      expect(question.content).to eq("Here is some advice")
    end

    it 'makes a question that ron did not say' do
      expect(question.ron_said_it).to be false
    end
  end
end
