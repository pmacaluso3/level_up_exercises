require 'httparty'
require 'json'

class AdviceTransformer
	ADVICE_URL_BASE = "http://api.adviceslip.com/advice"

	attr_reader :response_hash

	def initialize(id_number = "")
		response = make_request(id_number)
		@response_hash = JSON.parse(response)
	end

	def has_error?
		return true unless response_hash.has_key?("slip")
		!(response_hash["slip"].has_key?("advice"))
	end

	def new_quote
		if has_error?
		 	return false
		else
			Quote.new(content: response_hash["slip"]["advice"], ron_said_it: false)	
		end
	end

	def make_request(id_number)
		url_extension = id_number.to_s == "" ? "" : "/" + id_number.to_s
		HTTParty.get(ADVICE_URL_BASE + url_extension)
	end
end