require 'rails_helper'

describe AdviceFetcher do
	response = described_class.new.make_request

	it 'has the correct API url' do
		expect(described_class::ADVICE_URL_BASE).to eq("http://api.adviceslip.com/advice")
	end

	it 'makes a request to the url of the API' do
		expect(response).not_to be(nil)
	end

	it 'response is in the expected format' do
		expect(response =~ /slip/).to be_truthy
		expect(response =~ /advice/).to be_truthy
	end

	it 'gets a specific slip when given a specific slip_id' do
		response_1 = described_class.new(1).make_request
		expect(response_1).to eq("{\"slip\": {\"advice\":\"Remember that spiders are more afraid of you, than you are of them.\"}}")
	end
end