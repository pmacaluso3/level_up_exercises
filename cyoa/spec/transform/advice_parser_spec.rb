require 'rails_helper'

describe AdviceParser do
	let (:non_error_slip) { "{\"slip\": {\"advice\":\"Remember that spiders are more afraid of you, than you are of them.\"}}" }
	let (:error_slip) { "{\"message\": {\"type\": \"error\", \"text\": \"Advice slip not found.\"}}" }

	context 'with an error slip' do
		let (:quote) { described_class.new(error_slip).make_quote }

		it '#make_quote should return false for an error slip' do
			expect(quote).to be false
		end
	end

	context 'with a non-error slip' do
		let (:quote) { described_class.new(non_error_slip).make_quote }

		it 'makes a quote out of a non-error slip with the correct content' do
			expect(quote).to be_a(Quote)
			expect(quote.content).to eq("Remember that spiders are more afraid of you, than you are of them.")
		end

		it 'makes a quote that ron didn\'t say' do
			expect(quote.ron_said_it).to be false
		end
	end

end