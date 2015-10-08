require 'rails_helper'

describe RonParser do
	let(:ron_parser) {described_class.new}

	it 'has an array of strings' do
		expect(ron_parser.csv_data).to be_a(Array)
		expect(ron_parser.csv_data[0]).to be_a(String)
	end

	it 'makes a quote object out of each string' do
		expect(ron_parser.make_quote("I'm Ron")).to be_a(Quote)
	end

	it 'makes a quote that ron said' do
		expect(ron_parser.make_quote("I'm Ron").ron_said_it).to be true
	end

	it 'writes all new quotes to the database' do
		Quote.destroy_all
		ron_parser.make_all_quotes!
		expect(Quote.count).to eq(ron_parser.csv_data.length)
		Quote.destroy_all
	end
end
